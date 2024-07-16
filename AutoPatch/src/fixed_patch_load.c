#include "patch_point.h"
#include "iotpatch.h"
#include "patch_service.h"
#include "utils.h"
//#include "ebpf.h"
#include "ebpf_allocator.h"
#include "fixed_patch_points.h"
//#include "ebpf_vm.c"
#include "ebpf_allocator.c"
//#include "local_patches.c"


///CVE 10021
#include <zephyr/usb/class/usb_msc.h>

///CVE 10023
#include <ctype.h> //for isspace
#include <stddef.h> //for memmove
#include <zephyr/toolchain.h> //for memmove



//struct local_patch {
//	const char *cve;
//	uint32_t loc;
//	const uint8_t *code;
//	int code_len;
//};

struct local_patch {
	const char *cve;
	uint32_t loc;
	uint64_t (*func) (uint32_t sp);
	int code_len;
};

struct stack_frame;

struct local_patch2 {
	const char *cve;
	uint32_t loc;
	uint64_t (*func) (struct stack_frame *frame);
	int code_len;
};

typedef struct fixed_stack_frame2 {
	uint32_t r0_1;
	uint32_t lr; // patch index
	// uint32_t r3;
	// uint32_t r2;
	// uint32_t r1;
	// uint32_t r0;
	// uint32_t fp;
	// uint32_t return_address; // real lr
	// uint32_t args4;
	// uint32_t args5;
} fixed_stack_frame2;

// static patch_desc *_desc;
patch_desc *_desc;
//static ebpf_patch *_patch;
static auto_patch *_patch;
static bool is_init = false;

static void setup_cve_list();


//inline uint64_t set_return(uint64_t op, uint64_t ret_code) {
uint64_t set_return(uint64_t op, uint64_t ret_code) {
	return (op << 32) + ret_code;
}


//CVE-2020-10062
#define MQTT_MAX_PAYLOAD_SIZE 0x0FFFFFFF

uint64_t patch_cve_10062(uint32_t sp){
	uint32_t op = FILTER_PASS;
	uint32_t ret_code = 0;
	
	uint8_t shift = *(uint32_t *) (sp + 15);
	uint8_t bytes = *(uint32_t *) (sp + 14);
	int ERR = *(uint32_t *) (sp + 8);
	uint32_t *length = *(uint32_t *) (sp + 0);
	//struct dummy_MQTT_buf_ctx *buf = *(uint32_t *)(sp + 4);
	
	//printf("The value of shift %u and bytes %u and ERR %i and length 0x%08x and buf->cur %u \n", shift, bytes , ERR , *length, *(buf->cur));
	///printf("The value of shift %u and bytes %u and ERR %i and length 0x%08x \n", shift, bytes , ERR , *length);
	
	if(bytes >= 4){
		op = 1; //FILTER_DROP
		ret_code = -EINVAL;
		return set_return(op, ret_code);
	}
	
	//Complete this....
	//This CVE corrects two parts
	if (*length > MQTT_MAX_PAYLOAD_SIZE) {
        	op = 1;
        	ret_code = -EINVAL;
    	}
	
	
	return set_return(op, ret_code);
}
//**********//


//CVE-2020-10021
#define BLOCK_SIZE	512
uint64_t patch_cve_10021(uint32_t sp){
	uint32_t op = FILTER_PASS;
	uint32_t ret_code = 0;

    	uint32_t spold = (sp - sizeof(fixed_stack_frame2));
    	uint32_t lr = *(uint32_t *) (spold + 4);
	uint32_t addr = (lr - 4) & (~0x3);//The address of the vulnerable function for getting global variables
	
	///printf("(fixed_patch_load) try to get patch at: 0x%08x\n", addr);
	
	///Find out how to get these values automatically?
    	struct CBW *cbw = *(uint32_t *)(addr + 296);
    	uint32_t *mem_size = *(uint32_t *) (addr + 308);///memory_size = block_count * BLOCK_SIZE; From the original code
    	
    	uint32_t n = ((*cbw).CB[2] << 24) | ((*cbw).CB[3] << 16) | ((*cbw).CB[4] <<  8) | ((*cbw).CB[5] <<  0);
	///printf("(fixed_patch_load) LBA (block) and memory_size and cbw : 0x%x and 0x%x and 0x%x \n", n , *mem_size , *cbw);
	///printf("(fixed_patch_load) cbw.CB[2] and block-size is : %u and %u \n", (*cbw).CB[2], BLOCK_SIZE);
	
   	if (n * BLOCK_SIZE >= mem_size) {
   		///Why RapidPatche said Redirect?!
        	///op = FILTER_REDIRECT;
        	///ret_code = MARCO_BLOCK_RET;
        	op = 1;
        	ret_code = -EINVAL;
    	}

	return set_return(op, ret_code);
}
//**********//



//dummy_bug_function
uint64_t dummy_bug_function(uint32_t sp){
	uint32_t op = FILTER_PASS;
	uint32_t ret_code = 0;
	
	uint8_t shift = *(uint32_t *) (sp + 15);
	uint8_t bytes = *(uint32_t *) (sp + 14);
	int ERR = *(uint32_t *) (sp + 8);
	uint32_t *length = *(uint32_t *) (sp + 0);
	//struct dummy_MQTT_buf_ctx *buf = *(uint32_t *)(sp + 4);
	
	//printf("The value of shift %u and bytes %u and ERR %i and length 0x%08x and buf->cur %u \n", shift, bytes , ERR , *length, *(buf->cur));
	///printf("The value of shift %u and bytes %u and ERR %i and length 0x%08x \n", shift, bytes , ERR , *length);
	
	if(bytes >= 4){
		op = 1; //FILTER_DROP
		ret_code = -EINVAL;
	}
	
	//Complete this....
	//This CVE corrects two parts
	
	
	
	return set_return(op, ret_code);
}
//**********//


static struct local_patch patch_list[] = {
	{"dummy_bug_function", 0x08002950, dummy_bug_function, sizeof(dummy_bug_function)},
	{"zephyr_cve_2020_10062 dummy_MQTT_packet_length_decode_patch", 0x00002360, patch_cve_10062, sizeof(patch_cve_10062)},
	{"zephyr_cve_2020_10021", 0x0000e0be, patch_cve_10021, sizeof(patch_cve_10021)},
	{"dummy_bug_function", 0x08002c8e, dummy_bug_function, sizeof(dummy_bug_function)},
	
};

extern uint64_t filter(struct stack_frame *frame);


static struct local_patch2 patch_list2[] = {
	{"zephyr_cve_2020_10062 dummy_MQTT_packet_length_decode_patch", 0x000019bc, filter, sizeof(patch_cve_10062)},
	{"zephyr_cve_2020_10062 dummy_MQTT_packet_length_decode_patch", 0x000019bc, filter, sizeof(patch_cve_10062)},

};



// Function to perform binary search on patch_list array
// uint64_t (*binary_search_by_lr(int size , uint32_t loc))(uint32_t sp) {
// 	// int n  = sizeof(patch_list2) / sizeof(patch_list2[0]);
// 	// printf("The size of array: %d \n", n);

//     int low = 0;
//     int high = size - 1;

//     while (low <= high) {
//         int mid = (low + high) / 2;

//         if (patch_list2[mid].loc == loc) {
//             return patch_list2[mid].func;
//         } else if (patch_list2[mid].loc < loc) {
//             low = mid + 1;
//         } else {
//             high = mid - 1;
//         }
//     }

//     return NULL; // Return NULL if the loc value is not found
// }



void setup_cve_list() {
	// patch_list[0].loc = (uint32_t) (bug_f)
}

void show_fixed_patch_desc() {
	int n = sizeof(patch_list) / sizeof(struct local_patch);
	for (int i = 0; i < n; i++) {
		printf("%d -> %s\n", i, patch_list[i].cve);
	}
	setup_cve_list();
}

void load_local_fixed_patch(int pid) {
	int n = sizeof(patch_list) / sizeof(struct local_patch);
	printf("The number of local patch is  %d\n", n);
	//if (pid > n) {
	if (pid >= n) {
		show_fixed_patch_desc();
		printf("patch id should less than %d\n", n);
		return;
	}

	if (!is_init) {
		//printf("Initialising \n");
		_desc = ebpf_calloc(1, sizeof(patch_desc));
		_patch = ebpf_calloc(1, sizeof(auto_patch));
		is_init = true;
		init_patch_sys();
	}
	// init_patch_sys();

	printf("start to load patch: %d\n", pid);
	struct local_patch *pt = &patch_list[pid];
	_desc->type = FixedPatchPoint;
	//_desc->code_len = 0; // code do not save in desc now
	// inst addr should be divided by 4
	_desc->code_len = pt->code_len;
	_desc->fixed_id = pt->loc;
	printf("The location of patch is 0x%08x \n", _desc->fixed_id);
	_desc->func = pt->func;
	_desc->cve = pt->cve;
	_patch->desc = _desc;

	//////////////******Do we need these?************///

	
	////////////*******////

	load_local_patch_to_ctx(_patch);
	printf("load fixed patch %s success!\n", pt->cve);
}


void create_patch_desc_new(int pid) {
	int n = sizeof(patch_list) / sizeof(struct local_patch);
	// printf("The number of local patch is  %d\n", n);
	//if (pid > n) {
	if (pid >= n) {
		show_fixed_patch_desc();
		printf("patch id should less than %d\n", n);
		return;
	}
	if (!is_init) {
		printf("Initialising \n");
		_desc = ebpf_malloc(sizeof(patch_desc));
		is_init = true;
	}
	init_patch_sys();

	struct local_patch *pt = &patch_list[pid];
	_desc->type = FixedPatchPoint;
	//_desc->code_len = 0; // code do not save in desc now
	// inst addr should be divided by 4
	// _desc->code_len = pt->code_len;
	_desc->fixed_id = pt->loc;
	printf("The location of patch is 0x%08x \n", _desc->fixed_id);
	_desc->func = pt->func;
	_desc->cve = pt->cve;

	notify_new_patch(_desc);

}