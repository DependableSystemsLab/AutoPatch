#include "ebpf_vm.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "ebpf_allocator.h"
#include "ebpf.h"
#include "utils.h"
#include "ebpf_helper_impl.h"

static ebpf_helper_env *g_helper_func = NULL;
static ebpf_helper_env* use_default_helper_func();

#define MAX_ITERS 0x8000

static bool iters_check(int pc);
static bool bounds_check(const struct ebpf_vm *vm, void *addr, int size, const char *type, u16 cur_pc, void *mem, size_t mem_len, void *stack);

ebpf_vm *init_ebpf_vm(const uint8_t *code, uint32_t code_len) {
	ebpf_vm *vm = (ebpf_vm *) ebpf_malloc(sizeof(ebpf_vm));
	if (vm == NULL) {
		return NULL;
	}
	// vm->helper_func = NULL;
	vm->insts = (struct ebpf_inst *) code;
	vm->num_insts = (u16) code_len / sizeof(vm->insts[0]);
	init_iot_ebpf_helpers(vm);
	return vm;
}

struct ebpf_vm *ebpf_create(void) {
	struct ebpf_vm * vm = (struct ebpf_vm *) ebpf_calloc(1, sizeof(struct ebpf_vm));

	if (vm == NULL) {
		return NULL;
	}

	return vm;
}

void ebpf_vm_set_inst(struct ebpf_vm *vm, const uint8_t *code, uint32_t code_len) {
	memset(vm, 0, sizeof(struct ebpf_vm));
	vm->insts = (struct ebpf_inst *) code;
	vm->num_insts = (u16) code_len / sizeof(vm->insts[0]);
	init_iot_ebpf_helpers(vm);
}

int ebpf_vm_load(struct ebpf_vm *vm, const void *code, u32 code_len) {
	if (vm->insts) {
		return -1;
	}
	vm->insts = ebpf_malloc(code_len);
	if (vm->insts == NULL) {
		//*errmsg = ubpf_error("out of memory");
		return -1;
	}

	memcpy(vm->insts, code, code_len);
	vm->num_insts = (u16) code_len / sizeof(vm->insts[0]);
	return 0;
}

int ebpf_register(struct ebpf_vm *vm, unsigned int idx, const char *name, void *fn)
{
	if (vm->helper_func == NULL) {
		vm->helper_func = use_default_helper_func();
	}

	if (idx >= MAX_EXT_FUNCS) {
		return -1;
	}

	vm->helper_func->ext_funcs[idx] = (ext_func)fn;
	// DEBUG_LOG("ebpf_register: 0x%08x 0x%08x\n", vm->helper_func->ext_funcs, fn);
	// vm->helper_func->ext_func_names[idx] = name;
	return 0;
}

static ebpf_helper_env* use_default_helper_func() {
	if (g_helper_func == NULL) {
		g_helper_func = ebpf_calloc(1, sizeof(ebpf_helper_env));
		g_helper_func->ext_funcs = ebpf_calloc(MAX_EXT_FUNCS, sizeof(ext_func));
		// g_helper_func->refcnt = 0;
	}
	g_helper_func->refcnt++;
	return g_helper_func;
}

/*
Currently, in IoT context all VM share one ebpf helper env.
*/
void init_iot_ebpf_helpers(struct ebpf_vm *vm) {
	vm->helper_func = use_default_helper_func();
	set_default_helpers(vm);
}

void ebpf_vm_destroy(struct ebpf_vm *vm) {
	if (g_helper_func != NULL) {
		g_helper_func->refcnt--;
		if (g_helper_func->refcnt == 0) {
			ebpf_free(g_helper_func->ext_funcs);
			ebpf_free(g_helper_func);
			g_helper_func = NULL;
		}
	}
	// ebpf_free(vm->insts);
	ebpf_free(vm);
}

u64 ebpf_vm_exec(const struct ebpf_vm *vm, void *mem, u32 mem_len) {
	u64 ret = 0;
	u16 pc = 0;
	const struct ebpf_inst *insts = vm->insts;
	u64 reg[MAX_BPF_EXT_REG];
	u64 stack[(STACK_SIZE + 7) / 8];
	reg[1] = (uintptr) mem;
	reg[10] = (uintptr) stack + sizeof(stack);
	int tick = 0;

#define DST reg[inst->dst]
#define SRC reg[inst->src]
#define IMM inst->imm
#define AX	reg[MAX_BPF_EXT_REG - 1]
#define BOUNDS_CHECK_LOAD(size) \
	do { \
		if (!bounds_check(vm, reg[inst->src] + inst->offset, size, "load", cur_pc, mem, mem_len, stack)) { \
			return -1; \
		} \
	} while(0)
#define BOUNDS_CHECK_STORE(size) \
	do { \
		if (!bounds_check(vm, reg[inst->src] + inst->offset, size, "store", cur_pc, mem, mem_len, stack)) { \
			return -1; \
		} \
	} while(0)

	while (true) {
		const u16 cur_pc = pc;
		const struct ebpf_inst *inst = &insts[pc++];
		switch (inst->opcode) {
			// 32
		case EBPF_OP_ADD_IMM:
			DST = (u32)DST + (u32)IMM;
			break;
		case EBPF_OP_ADD_REG:
			DST = (u32)DST + (u32)SRC;
			break;
		case EBPF_OP_SUB_IMM:
			DST = (u32)DST - (u32)IMM;
			break;
		case EBPF_OP_SUB_REG:
			DST = (u32)DST - (u32)SRC;
			break;
		case EBPF_OP_MUL_IMM:
			DST = (u32)DST * (u32)IMM;
			break;
		case EBPF_OP_MUL_REG:
			DST = (u32)DST * (u32)SRC;
			break;
		case EBPF_OP_DIV_IMM:
			DST = (u32)DST / (u32)IMM;
			break;
		case EBPF_OP_DIV_REG:
			if (SRC == 0) {
				//fprintf(stderr, "uBPF error: division by zero at PC %u\n", cur_pc);
				return -1;
			}
			DST = (u32)DST / (u32)SRC;
			break;
		case EBPF_OP_OR_IMM:
			DST = (u32)DST | (u32)IMM;
			break;
		case EBPF_OP_OR_REG:
			DST = (u32)DST | (u32)SRC;
			break;
		case EBPF_OP_AND_IMM:
			DST = (u32)DST & (u32)IMM;
			break;
		case EBPF_OP_AND_REG:
			DST = (u32)DST & (u32)SRC;
			break;
		case EBPF_OP_LSH_IMM:
			DST = (u32)DST << (u32)IMM;
			break;
		case EBPF_OP_LSH_REG:
			DST = (u32)DST << (u32)SRC;
			break;
		case EBPF_OP_RSH_IMM:
			DST = (u32)DST >> (u32)IMM;
			break;
		case EBPF_OP_RSH_REG:
			DST = (u32)DST >> (u32)SRC;
			break;
		case EBPF_OP_NEG:
			DST = (u32)-DST;
			break;
		case EBPF_OP_MOD_IMM:
			DST = (u32)DST % (u32)IMM;
			break;
		case EBPF_OP_MOD_REG:
			if (reg[inst->src] == 0) {
				//fprintf(stderr, "uBPF error: division by zero at PC %u\n", cur_pc);
				return -1;
			}
			DST = (u32)DST % (u32)SRC;
			break;
		case EBPF_OP_XOR_IMM:
			DST = (u32)DST ^ (u32)IMM;
			break;
		case EBPF_OP_XOR_REG:
			DST = (u32)DST ^ (u32)SRC;
			break;
		case EBPF_OP_MOV_IMM:
			DST = (u32)IMM;
			break;
		case EBPF_OP_MOV_REG:
			DST = (u32)SRC;
			break;
		case EBPF_OP_ARSH_IMM:
			DST = (u64)(u32)(((s32)DST) >> IMM);
			break;
		case EBPF_OP_ARSH_REG:
			DST = (u64)(u32)(((s32)DST) >> SRC);
			break;
		case EBPF_OP_LE:
			switch (IMM) {
			case 16:
				DST = my_htole16(DST);
				break;
			case 32:
				DST = my_htole32(DST);
				break;
			case 64:
				DST = my_htole64(DST);
				break;
			}
			break;
		case EBPF_OP_BE:
			switch (IMM) {
			case 16:
				DST = my_htobe16(DST);
				break;
			case 32:
				DST = my_htobe32(DST);
				break;
			case 64:
				DST = my_htobe64(DST);
				break;
			}
			break;
			// 64
		case EBPF_OP_ADD64_IMM:
			DST = DST + IMM;
			break;
		case EBPF_OP_ADD64_REG:
			DST = DST + SRC;
			break;
		case EBPF_OP_SUB64_IMM:
			DST = DST - IMM;
			break;
		case EBPF_OP_SUB64_REG:
			DST = DST - SRC;
			break;
		case EBPF_OP_MUL64_IMM:
			DST = DST * IMM;
			break;
		case EBPF_OP_MUL64_REG:
			DST = DST * SRC;
			break;
		case EBPF_OP_DIV64_IMM:
			DST = DST / IMM;
			break;
		case EBPF_OP_DIV64_REG:
			if (SRC == 0) {
				//fprintf(stderr, "uBPF error: division by zero at PC %u\n", cur_pc);
				return -1;
			}
			DST = DST / IMM;
			break;
		case EBPF_OP_OR64_IMM:
			DST = DST | IMM;
			break;
		case EBPF_OP_OR64_REG:
			DST = DST | SRC;
			break;
		case EBPF_OP_AND64_IMM:
			DST = DST & IMM;
			break;
		case EBPF_OP_AND64_REG:
			DST = DST & SRC;
			break;
		case EBPF_OP_LSH64_IMM:
			DST = DST << IMM;
			break;
		case EBPF_OP_LSH64_REG:
			DST = DST << SRC;
			break;
		case EBPF_OP_RSH64_IMM:
			DST = DST >> IMM;
			break;
		case EBPF_OP_RSH64_REG:
			DST = DST >> SRC;
			break;
		case EBPF_OP_NEG64:
			DST = -DST;
			break;
		case EBPF_OP_MOD64_IMM:
			DST = DST % IMM;
			break;
		case EBPF_OP_MOD64_REG:
			if (SRC == 0) {
				//fprintf(stderr, "uBPF error: division by zero at PC %u\n", cur_pc);
				return -1;
			}
			DST = DST % SRC;
			break;
		case EBPF_OP_XOR64_IMM:
			DST = DST ^ IMM;
			break;
		case EBPF_OP_XOR64_REG:
			DST = DST ^ SRC;
			break;
		case EBPF_OP_MOV64_IMM:
			DST = IMM;
			// DEBUG_LOG("MOV: reg[%d] = %d\n", inst->dst, IMM);
			break;
		case EBPF_OP_MOV64_REG:
			DST = SRC;
			break;
		case EBPF_OP_ARSH64_IMM:
			(*(s64 *)&DST) >>= IMM;
			break;
		case EBPF_OP_ARSH64_REG:
			DST = (s64) DST >> SRC;
			break;
		case EBPF_OP_LDXDW:
			BOUNDS_CHECK_LOAD(8);
			//uintptr* ptr = SRC + inst->offset;
			//printf("ptr = %p %u , val=%u %p\n", ptr, ptr, *ptr, *ptr);
			DST = *(u64*)(uintptr)(SRC + inst->offset);
			break;
		case EBPF_OP_LDXW:
			//BOUNDS_CHECK_LOAD(4);
			//ptr = ;
			//DEBUG_LOG("EBPF_OP_LDXW\n");
			DST = *(u32*)(uintptr)(SRC + inst->offset);
			break;
		case EBPF_OP_LDXH:
			BOUNDS_CHECK_LOAD(2);
			DST = *(u16*)(uintptr)(SRC + inst->offset);
			break;
		case EBPF_OP_LDXB:
			BOUNDS_CHECK_LOAD(1);
			DST = *(u8*)(uintptr)(reg[inst->src] + inst->offset);
			break;
		// store
		case EBPF_OP_STDW:
			BOUNDS_CHECK_STORE(8);
			*(u64*)(uintptr)(DST + inst->offset) = IMM;
			break;
		case EBPF_OP_STW:
			BOUNDS_CHECK_STORE(4);
			*(u32*)(uintptr)(DST + inst->offset) = IMM;
			break;
		case EBPF_OP_STH:
			BOUNDS_CHECK_STORE(2);
			*(u16*)(uintptr)(DST + inst->offset) = IMM;
			break;
		case EBPF_OP_STB:
			BOUNDS_CHECK_STORE(1);
			*(u8*)(uintptr)(DST + inst->offset) = IMM;
			break;
		
		case EBPF_OP_STXDW:
			BOUNDS_CHECK_STORE(8);
			*(u64*)(uintptr)(DST + inst->offset) = SRC;
			break;
		case EBPF_OP_STXW:
			BOUNDS_CHECK_STORE(4);
			*(u32*)(uintptr)(DST + inst->offset) = SRC;
			break;
		case EBPF_OP_STXH:
			BOUNDS_CHECK_STORE(2);
			*(u16*)(uintptr)(DST + inst->offset) = SRC;
			break;
		case EBPF_OP_STXB:
			BOUNDS_CHECK_STORE(1);
			*(u8*)(uintptr)(DST + inst->offset) = SRC;
			break;
	
		case EBPF_OP_LDDW:
			DST = (u64) (u32)IMM | ((u64) (u32)insts[pc++].imm << 32);
			break;

			// op jump
			// 32
		case EBPF_OP_JA:
			pc += inst->offset;
			break;
		case EBPF_OP_JEQ_REG:
			if (DST == SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JEQ_IMM:
			if (DST == IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JGT_IMM:
			if (DST > (u32)IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JGT_REG:
			if (DST > SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JGE_IMM:
			if (DST >= (u32)IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JGE_REG:
			if (DST >= SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JLT_IMM:
			if (DST < (u32)IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JLT_REG:
			if (DST < SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JLE_IMM:
			if (DST <= (u32)IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JLE_REG:
			if (DST <= SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSET_IMM:
			if (DST & IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSET_REG:
			if (DST & SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JNE_IMM:
			if (DST != IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JNE_REG:
			if (DST != SRC) {
				pc += inst->offset;
			}
			break;

		// 64
		case EBPF_OP_JSGT_IMM:
			// DEBUG_LOG("EBPF_OP_JSGT_REG %d %d\n", (s64) DST, (s64) IMM);
			if ((s64)DST > (s64) IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSGT_REG:
			if ((s64)DST > (s64)SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSGE_IMM:
			if ((s64)DST >= (s64) IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSGE_REG:
			if ((s64)DST >= (s64)SRC) {
				pc += inst->offset;
			}
			break; 
		case EBPF_OP_JSLT_IMM:
			if ((s64)DST < (s64) IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSLT_REG:
			if ((s64)DST < (s64)SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSLE_IMM:
			if ((s64)DST <= (s64) IMM) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_JSLE_REG:
			if ((s64)DST <= (s64)SRC) {
				pc += inst->offset;
			}
			break;
		case EBPF_OP_CALL:
			// DEBUG_LOG("VM call func: %d at: 0x%08x a1:%d a2:%d a3:%d a4:%d\n", inst->imm, (u32)reg[1], (u32)reg[2], (u32)reg[3], (u32)reg[4], (u32)reg[5]);
			// DEBUG_LOG("%d %d %d %d %d\n", (u32)reg[1], (u32)reg[2], (u32)reg[3], (u32)reg[4], (u32)reg[5]);
			// ctypes
			reg[0] = vm->helper_func->ext_funcs[inst->imm](reg[1], reg[2], reg[3], reg[4], reg[5]);
			break;
		case EBPF_OP_EXIT:
			return reg[0];
		}

		if (!iters_check(tick++)) {
			// FILTER_DROP
			DEBUG_LOG("SFI: Exceed the max iteration number: %d > %d!\n", tick, MAX_ITERS);
			return 1 << 32;
		}
	}

	return ret;
}

bool iters_check(int tick) {
	if (tick > MAX_ITERS) {
		return false;
	}
	return true;
}

bool bounds_check(const struct ebpf_vm *vm, void *addr, int size, const char *type, u16 cur_pc, void *mem, size_t mem_len, void *stack) {
	if (!vm->bounds_check_enabled) {
		return true;
	}
	if (mem && (addr >= mem && ((u32*)addr + size) <= ((u32*)mem + mem_len))) {
		return true;
	}
	else if (addr >= stack && ((u32*)addr + size) <= ((u32*)stack + STACK_SIZE)) {
		return true;
	}
	else {
		//fprintf(stderr, "uBPF error: out of bounds memory %s at PC %u, addr %p, size %d\n", type, cur_pc, addr, size);
		//fprintf(stderr, "mem %p/%zd stack %p/%d\n", mem, mem_len, stack, STACK_SIZE);
		return false;
	}
	return true;
}
