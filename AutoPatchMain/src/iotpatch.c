#include "iotpatch.h"
#include "utils.h"
//#include "patch_point.h"
#include "patch_service.h"
//#include "ebpf.h"
#include "ebpf_allocator.h"
#include "hashmap.c"
//#include "cortex-m4_fbp.c"
#include "utils.c"

#include <string.h>
#include <stddef.h>
// global patch context
static bool ctx_init = false;
patch_context pctx;

static void update_bits_filter() {
	pctx.fbits_filter = 0;
	printf("Number ****** : %d \n", pctx.fpatch_list.fiexed_patches->cur_size);
	for (int i = 0; i < pctx.fpatch_list.fiexed_patches->cur_size; i++) {
		const auto_patch *patch = arraymap_iter_val(pctx.fpatch_list.fiexed_patches, i);
		printf("Man injam! \n");
		printf("%d %d 0x%08x \n", patch->is_active , patch != NULL , patch->desc->fixed_id); 
		if (patch != NULL && patch->is_active) {
			printf("HHHHHHHHHHHHHH \n");
			pctx.fbits_filter |= patch->desc->fixed_id;
		}
	}

//	pctx.dbits_filter_pc = pctx.dbits_filter_bpkt = 0;
//	dynamic_patch *dp = pctx.dpatch_list.next;
//	while (dp != NULL) {
//		pctx.dbits_filter_pc |= dp->pc_addr;
//		pctx.dbits_filter_bpkt |= dp->inst_addr;
//		dp = dp->next;
//	}
}

auto_patch *auto_patch_setup(patch_desc *desc) {
	auto_patch *patch = ebpf_malloc(sizeof(auto_patch));
	patch->desc = desc;
	patch->is_active = false;
	return patch;
}

// should use lock
// read copy and update
static void active_patch(auto_patch *patch) {
	update_bits_filter();
	if (patch->desc->type == FixedPatchPoint) {
		pctx.fbits_filter |= patch->desc->fixed_id;
		printf("Active fixed patch idx: %d %d\n", patch->desc->fixed_id , pctx.fbits_filter);
	} else if (patch->desc->type == DynamicPatchPoint) {
		// pctx.dbits_filter |= calc_bpkt_pc(patch->desc->inst_addr);
		//add_hw_bkpt(patch->desc->inst_addr);
	}
	
	patch->is_active = true;
}

//static dynamic_patch* add_dynamic_patch_to_ctx(ebpf_patch *patch) {
//	dynamic_patch *dp = pctx.dpatch_list.next;
//	dynamic_patch *cur = NULL, *tail = &pctx.dpatch_list;
//	int cnt = 0;
//	while (dp != NULL) {
//		if (dp->inst_addr == patch->desc->inst_addr) {
//			cur = dp;
//			break;
//		}
//		tail = dp;
//		dp = dp->next;
//		cnt++;
//	}
//	if (cur == NULL) {
//		if (cnt > MAX_DP_NUM) { // overwrite the last one
//			//return NULL;
//			printf("Warning: dynamic patch exceed the maximum number(6).\n");
//			cur = tail;
//		} else {
//			cur = ebpf_malloc(sizeof(dynamic_patch));
//			tail->next = cur;
//		}
//	}
//	cur->next = NULL;
//	cur->inst_addr = calc_bpkt_addr(patch->desc->inst_addr);
//	cur->pc_addr = calc_bpkt_pc(cur->inst_addr);
//	cur->patch = patch;
//	return cur;
//}

static void add_fixed_patch_to_ctx(auto_patch *patch) {
	arraymap_set(pctx.fpatch_list.fiexed_patches, patch->desc->fixed_id, patch);
}

static auto_patch* add_ebpf_patch(patch_desc *desc) {
	auto_patch *patch = auto_patch_setup(desc);
	if (desc->type == FixedPatchPoint) {
		add_fixed_patch_to_ctx(patch);
	} else if (desc->type == DynamicPatchPoint) {
		// desc->inst_addr &= ~0x3; // inst addr should divided by 4
		// add_dynamic_patch_to_ctx(patch);
	}
	return patch;
}

void init_patch_sys(void) {
	if (ctx_init) {
		return;
	}
	int v = 1;
	printf("init_patch_sys: %d\n", v);
	const int init_size = 8;
	memset(&pctx, 0, sizeof(pctx));
	pctx.fpatch_list.fiexed_patches = arraymap_new(4);
	update_bits_filter();
	ctx_init = true;
}

void destory_patch_context() {
	// arraymap_destroy(pctx.fpatch_list.fiexed_patches);
	if (pctx.fpatch_list.fiexed_patches != NULL) {
		arraymap_destroy(pctx.fpatch_list.fiexed_patches);
		pctx.fpatch_list.fiexed_patches = NULL;
	}
//	dynamic_patch *dp = pctx.dpatch_list.next, *next = NULL;
//	while (dp != NULL) {
//		next = dp->next;
//		destory_ebpf_patch(dp->patch);
//		ebpf_free(dp);
//		dp = next;
//	}
	// pctx.fixed_patches = NULL;
//	pctx.dpatch_list.next = NULL;
//	pctx.dbits_filter_bpkt = pctx.dbits_filter_pc = pctx.fbits_filter = 0;
	ctx_init = false;

	// remove all hardware breakpoints
//	clear_all_hw_bkpt();
}

void destory_ebpf_patch(ebpf_patch *patch) {
	if (patch != NULL) {
		ebpf_free(patch->desc);
		ebpf_free(patch->vm);
		ebpf_free(patch);
	}
}

//void show_all_patches(void) {
//	printf("Dynamic Patch List:\n");
//	dynamic_patch *dp = pctx.dpatch_list.next;
//	while (dp != NULL) {
//		printf("dypk inst_addr: 0x%08x pc_addr: 0x%08x is_active: %d\n", dp->inst_addr, dp->pc_addr, dp->patch->is_active);
//		dp = dp->next;
//	}
//
//	printf("Fixed Patch List:\n");
//}

void notify_new_patch(struct patch_desc *desc) {
	printf("New Patch is OK!\n");
	// TODO: only save patch to flash
	auto_patch *patch = add_ebpf_patch(desc);
	// TODO: use lock to load to memory and active patch
	active_patch(patch);
}


// Function to get the number of patches stored in the arraymap
int get_num_patches() {
    if (pctx.fpatch_list.fiexed_patches == NULL) {
        return 0;
    }
    return sizeof(pctx.fpatch_list.fiexed_patches->cur_size);
}


auto_patch* get_fixed_patch_by_lr(uint32_t lr) {
			// printf("patch idx: %d %d\n", pctx.fbits_filter & lr , lr);

	if ((pctx.fbits_filter & lr) != lr) {
				// printf("why?! \n ");

		return NULL;
	}
	// printf("Patch is exist in the arraymap!\n");
	auto_patch *patch = arraymap_get(pctx.fpatch_list.fiexed_patches, lr);
	if (patch != NULL && patch->is_active) {
		printf("Chera?! \n ");
		return patch;
	}
	printf("Chera 2?! \n ");
	return NULL;
}

//ebpf_patch* get_dynamic_patch_by_pc(uint32_t loc) {
//	if ((pctx.dbits_filter_pc & loc) != loc) {
//		return NULL;
//	}
//	dynamic_patch *dp = pctx.dpatch_list.next;
//	while (dp != NULL) {
//		if (dp->pc_addr == loc && dp->patch->is_active) {
//			return dp->patch;
//		}
//		dp = dp->next;
//	}
//	return NULL;
//}

//ebpf_patch* get_dynamic_patch_by_bpkt(uint32_t loc) {
//if ((pctx.dbits_filter_bpkt & loc) != loc) {
//		return NULL;
//	}
//	dynamic_patch *dp = pctx.dpatch_list.next;
//	while (dp != NULL) {
//		if (dp->inst_addr == loc && dp->patch->is_active) {
//			return dp->patch;
//		}
//		dp = dp->next;
//	}
//	return NULL;
//}

//ebpf_patch* get_dynamic_patch_by_fpb(uint32_t fpb_addr) {
//	uint32_t align_addr = fpb_addr & (~0x1);
//	if ((pctx.dbits_filter_bpkt & fpb_addr) == fpb_addr ||
//		(pctx.dbits_filter_bpkt & align_addr) == align_addr) {
//		dynamic_patch *dp = pctx.dpatch_list.next;
//		while (dp != NULL) {
//			if ((dp->inst_addr == fpb_addr || dp->inst_addr == align_addr) && dp->patch->is_active) {
//				return dp->patch;
//			}
//			dp = dp->next;
//		}
//	}
//	return NULL;
//}

void load_local_patch_to_ctx(auto_patch *patch) {
	if (patch->desc->type == FixedPatchPoint) { 
		printf("The description of patch is %s \n", patch->desc->cve);
		add_fixed_patch_to_ctx(patch);
		active_patch(patch);
	} else if (patch->desc->type == DynamicPatchPoint) {
		// the same pointer only add once
//		dynamic_patch *dp = pctx.dpatch_list.next;
//		bool need_insert = true;
//		while (dp != NULL) {
//			if (dp->patch == patch) {
//				need_insert = false;
//				break;
//			}
//			dp = dp->next;
//		}
//		if (need_insert) {
//			dp = add_dynamic_patch_to_ctx(patch);
//		} else { // update current value
//			dp->inst_addr = calc_bpkt_addr(patch->desc->inst_addr);
//			dp->pc_addr = calc_bpkt_pc(dp->inst_addr);
//		}
//		printf("dynamic patch: pc=0x%08x inst=0x%08x\n", dp->pc_addr, dp->inst_addr);
//		active_patch(patch);
	}
}

//uint64_t run_ebpf_filter(ebpf_patch *patch, void *args, int args_size) {
//	if (patch->vm->use_jit) {
//		printf("h1");
//		return patch->vm->jit_func(args, args_size);
//	} else {
//		printf("h2");
//		return ebpf_vm_exec(patch->vm, args, args_size);
//	}
//}
