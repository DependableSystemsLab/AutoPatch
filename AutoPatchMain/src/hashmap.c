#include "hashmap.h"
#include "ebpf_allocator.h"
#include <stdint.h>
#include <string.h>
# include <stdio.h>
// #include "hotpatch/include/utils.h"

#define MAP_GROW 4

static int binary_search(void **arr, int size, uint32_t val) {
	int start = 0;
	int end = size - 1;
	while (start <= end) {
		int mid = (start + end) / 2;
		int m = (uint32_t) arr[mid];
		if (m == val) {
			return mid;
		} else if (m > val) {
			end = mid - 1;
		} else {
			start = mid + 1;
		}
	}
	return -1;
}

/*
 * lower_bound: find the first one not less than target
 */
static int lower_bound(void **arr, int size, uint32_t val) {
	int start = 0;
	int end = size; // return the tail
	int mid = 0;
	while (start + 1 < end) {
		mid = (start + end) / 2;
		if ((uint32_t) arr[mid] < val) { // (start, mid]
			start = mid;
		} else {
			end = mid;
		}
	}
	return end;
}

static int upper_bound(void **arr, int size, uint32_t val) {
	int start = 0;
	int end = size; // return the tail pos for insert
	int mid = 0;
	while (start + 1 < end) {
		mid = (start + end) / 2;
		if ((uint32_t) arr[mid] <= val) {
			start = mid;
		} else {
			end = mid;
		}
	}
	return end;
}

/*
use array to save a few data with key
*/
darray *darray_new(int initial_size) {
	int data_size = initial_size * sizeof(void *);
	darray *map = ebpf_malloc(sizeof(darray) + data_size);
	map->max_size = initial_size;
	map->cur_size = 0;
	//map->vals = (void **) ebpf_malloc(data_size);
	memset(map->vals, 0, data_size);
	return map;
}

void darray_destroy(darray *arr) {
	//ebpf_free(map->vals);
	ebpf_free(arr);
	arr = NULL;
}

int darray_add(darray *arr, void *val) {
	for (int i = 0; i < arr->cur_size; i++) {
		if (arr->vals[i] == NULL) {
			arr->vals[i] = val;
			return i;
		}
	}
	int idx = arr->cur_size++;
	if (arr->cur_size >= arr->max_size) {
		int new_size = arr->max_size + MAP_GROW;
		int ori_size = sizeof(darray) + arr->max_size * sizeof(void *);
		arr = ebpf_realloc(arr, ori_size, sizeof(darray) + new_size * sizeof(void *));
		arr->max_size = new_size;
	}
	arr->vals[idx] = val;
	return idx;
}

void* darray_get(darray *arr, int key) {
	if (key < arr->cur_size) {
		return arr->vals[key];
	}
	return NULL;
}

void darray_set(darray *arr, int key, void *val) {
	if (key < arr->max_size) {
		arr->vals[key] = val;
	}
}

void darray_del(darray *arr, int key) {
	if (key < arr->cur_size) {
		arr->vals[key] = NULL;
	}
}

arraymap *arraymap_new(int initial_size) {
	arraymap *map = ebpf_malloc(sizeof(arraymap));
	map->cur_size = 0;
	map->max_size = initial_size;
	map->keys = ebpf_malloc(initial_size * sizeof(void *));
	map->vals = ebpf_malloc(initial_size * sizeof(void *));
	return map;
}

void arraymap_destroy(arraymap *map) {
	ebpf_free(map->keys);
	ebpf_free(map->vals);
	ebpf_free(map);
}

int arraymap_set(arraymap *map, void *key, void *val) {
	//printf("The key is 0x%08x \n", (uint32_t)key);

	if (map->cur_size == 0) {
		//printf("a");
		map->keys[0] = key;
		map->vals[0] = val;
		map->cur_size++;
		return 0;
	}
	int insert = lower_bound(map->keys, map->cur_size, (uint32_t) key);
	// printf("Inserting in %d 0x%08x \n ", insert);
	// modify
	if ((uint32_t)(map->keys[insert]) == (uint32_t) key) {
				// printf("b");

		map->vals[insert] = val;
		return;
	}
	// insert
	if (map->cur_size >= map->max_size) {
				// printf("c");

		int new_size = map->max_size + MAP_GROW;
		int ori_size = sizeof(darray) + map->max_size * sizeof(void *);
		map->keys = ebpf_realloc(map->keys, ori_size, new_size * sizeof(void *));
		map->vals = ebpf_realloc(map->vals, ori_size, new_size * sizeof(void *));
		map->max_size = new_size;
	}
	for (int i = map->cur_size; i > insert; i--) {
				// printf("d");

		map->keys[i] = map->keys[i - 1];
		map->vals[i] = map->vals[i - 1];
	}
			// printf("e");

	map->keys[insert] = key;
	map->vals[insert] = val;
	map->cur_size++;
	// printf("%u insert: %d sz: %d\n", (uint32_t) key, insert, map->cur_size);
	return insert;
}

void* arraymap_get(arraymap *map, void * key) {
	int idx = binary_search(map->keys, map->cur_size, (uint32_t) key);
	//printf("search: %d key: %u sz: %d %d\n", idx, key, map->cur_size);
	if (idx != -1) {
		return map->vals[idx];
	}
	return NULL;
}

void* arraymap_iter_key(arraymap *map, int idx) {
	if (idx < 0 || idx >= map->cur_size) {
		return NULL;
	}
	return map->keys[idx];
}

void* arraymap_iter_val(arraymap *map, int idx) {
	if (idx < 0 || idx >= map->cur_size) {
		return NULL;
	}
	return map->vals[idx];
}

void arraymap_del(arraymap *map, void * key) {
	int idx = binary_search(map->keys, map->cur_size, (uint32_t) key);
	if (idx != -1) {
		for (int i = idx; i < map->cur_size; i++) {
			map->keys[i] = map->keys[i + 1];
			map->vals[i] = map->vals[i + 1];
		}
		map->cur_size--;
		map->keys[map->cur_size] = NULL;
		map->vals[map->cur_size] = NULL;
	}
}

/*
Hashmap
*/


/*
Tree map
red-black tree
*/

