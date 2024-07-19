/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */
#pragma GCC push_options
#pragma GCC optimize ("O0")

#include <zephyr/zephyr.h>
#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>

#include <zephyr/sys/time_units.h>       
#include <zephyr/timing/timing.h>      
#include <inttypes.h>
#include "utils.h"

#include "profiling.h"
#include "profiling.c"
#include "fixed_patch_points.h"
#include "fixed_patch_point_def.h"
#include "iotpatch.h"
#include "iotpatch.c"
#include <zephyr/sys/math_extras.h>

//#include "ebpf.h"
#include "fixed_patch_load.c"

//For CVE-2020-10063
#include <zephyr/sys/printk.h>
// #include <net/coap.h>
#include <zephyr/drivers/gpio.h>
#include <setjmp.h>

//For CVE-2020-10021
#include <zephyr/usb/class/usb_msc.h>
#include <zephyr/sys/byteorder.h>
#include <zephyr/sys/__assert.h>
#include <zephyr/storage/disk_access.h>
#include <zephyr/usb/class/usb_msc.h>
#include <zephyr/usb/usb_device.h>
// #include "hotpatch.h"

//CVE-2020-10024
//#include <zephyr/kernel_structs.h>
//#include <stdlib.h>
#include <zephyr/app_memory/app_memdomain.h>
//#include <zephyr/sys/util.h>
//#include <zephyr/debug/stack.h>
//#include <zephyr/syscall_handler.h>
#include <../lib/libc/minimal/include/limits.h>
//#include <sys/arch_interface.h>
//#include <arch/arc/syscall.h>
// #include <syscall_handler.h>


//CVE-2020-10024
// #include <drivers/gpio.h>
//#include <syscalls/kscan_config_mrsh.c>
// #include <drivers/kscan.h>

//#include "local_patches.c"
#include "patch_point.h"


#include "ebpf.h"
#include "ebpf_test.h"
#include "jit.c"
#include "ebpf_vm.c"


//** Blink Sample **//
#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
/* 1000 msec = 1 sec */
#define SLEEP_TIME_MS   1000

/* The devicetree node identifier for the "led0" alias. */
#define LED0_NODE DT_ALIAS(led0)

/*
 * A build error on this line means your board is unsupported.
 * See the sample documentation for information on how to fix this.
 */
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED0_NODE, gpios);


//int fixed_patch_point_hanlder(void) {
//	__asm volatile("PUSH {r0, r1, r2, r3, lr}");
//	__asm volatile("MRS r0, CONTROL"); //Move the contents of Control register to a general-purpose registerk
//	__asm volatile("TST r0, #2"); //"And" instruction with "r0" and "constant 2" but the result is discarded. 
//	__asm volatile("ITE EQ"); //Like Condition
//	__asm volatile("MRSEQ r0, MSP"); //main stack pointer
//	__asm volatile("MRSNE r0, PSP"); //process stack pointer
//	__asm volatile("BL dispatch_fixed_patch_point");
//	__asm volatile("POP {r0, r1, r2, r3, pc}");
//}
__NAKE int fixed_patch_point_hanlder(void) {
	// __asm("nop");
	__asm volatile("PUSH {r0, lr}");
	__asm volatile("MRS r0, CONTROL");
	__asm volatile("TST r0, #2");
	__asm volatile("ITE EQ");
	__asm volatile("MRSEQ r0, MSP");
	__asm volatile("MRSNE r0, PSP");
//	asm volatile("ADD r0, #8"); // set to origin sp (push {r0, lr})
	__asm volatile("BL dispatch_fixed_patch_point");
	__asm volatile("POP {r0, pc}");
//	asm volatile("ADDS r7, #16");
//	asm volatile("MOV  sp, r7");
//	asm volatile("pop {r7, pc}");
}

#ifndef FIXED_OP_PASS
  #define FIXED_OP_PASS 0x00010000 // set a unusual value
#endif

static struct dummy_MQTT_buf_ctx {
	unsigned char *cur;
    unsigned char *end;
};

static void call_dummy_buggy_MQTT_function();
static int dummy_buggy_MQTT_packet_length_decode(struct dummy_MQTT_buf_ctx *buf, uint32_t *length);
//static uint64_t patch_cve_10062(uint32_t sp);
extern int dummy_buggy_MQTT_packet_length_decode();


//typedef struct stack_frame {
//	uint32_t r0;
//	uint32_t r1;
//	uint32_t r2;
//	uint32_t r3;
//	uint32_t r12; // ip
//	uint32_t lr;
//	uint32_t pc; // return address
//	uint32_t xpsr;
//} tack_frame;


//typedef struct fixed_stack_frame {
//	uint32_t r0_1;
//	uint32_t r1_1;
//	uint32_t r2_1;
//	uint32_t r3;
//	uint32_t lr;
//} fixed_stack_frame;

typedef struct fixed_stack_frame {
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
} fixed_stack_frame;



///For Patch Execution Delay
typedef struct stack_frame {
	// I changed the first three variables from 32 to 8
	uint32_t r0;
	uint32_t r1;
	uint32_t r2;
	uint32_t r3;
	uint32_t r12; // ip
	uint32_t lr;
	uint32_t pc; // return address
	uint32_t xpsr;
} __attribute__((__packed__)) stack_frame;



//static void dump_stack(uint32_t sp) {
//	printf("SP: 0x%08x\n", sp);
//	for (int i = 0; i < 10; i++) {
//		uint32_t v = *(uint32_t *) (sp - 8 + 4 * i);
//		printf("[sp %d] 0x%08x\n", -8 + 4 * i, v);
//	}
//}

//static void dump_vm_args(fixed_stack_frame *args) {
//	printf("r0 = 0x%08x\n", args->r0_1);
//	
//	printf("r1 = 0x%08x\n", &(args->r1_1));
//	uint32_t *buf = (uint32_t *)(args->r3);
//	printf("length = %08x\n", *buf);
//
//}

void dispatch_fixed_patch_point(uint32_t sp) {
	//uint32_t lr = *(uint32_t *) (sp + offsetof(fixed_stack_frame, lr)); // r0-r3,lr
	//uint32_t addr = (lr & ~0x1) - 4; // bl function 
	//ebpf_patch *patch = get_fixed_patch_by_lr(addr);
	
	// profile_end(EV0);
	// profile_dump(EV0);
	
	uint32_t lr = *(uint32_t *) (sp + 4);
	uint32_t addr = (lr - 4) & (~0x3);
	

	// profile_add_event("EV0");
   	// profile_start(EV0);
	// auto_patch *patch = get_fixed_patch_by_lr(addr);//For evaluating "Patch Dispatching Delay", we need to put "profile" around this function. //We have to evaluate with different size of active patches
	// uint32_t t = profile_end(EV0);
	// profile_dump(EV0);
    // printf("cycles: %u\n", t);


	///auto_patch *patch = NULL;
	
	fixed_stack_frame *args = (fixed_stack_frame *) sp;
	
	// printf("try to get patch at: 0x%08x\n", addr);
	
	uint32_t sptemp = (sp + sizeof(fixed_stack_frame));
	// if (patch == NULL) {
	// 	*(volatile uint32_t *) &(args->r0_1) = FIXED_OP_PASS;
	// 	// printf("Do not find Patch here\n");
	// 	return;
	// } 

	//Since we store lr (main sp) we can also use spreal. spreal == sptemp both points to dummy stack
	//uint32_t sptemp = (sp + sizeof(fixed_stack_frame)) + 4;//SP for dummy function
	//uint32_t sptemp = (sp + sizeof(fixed_stack_frame));
	
	//uint32_t spreal = *(uint32_t *) (sp + sizeof(fixed_stack_frame));//SP for dummy function (in other way)
	
	//uint8_t shift = *(uint32_t *) (sptemp + 15);
	//uint8_t bytes = *(uint32_t *) (sptemp + 14);
	//int ERR = *(uint32_t *) (sptemp + 8);
	//uint32_t *length = *(uint32_t *) (sptemp + 0);


	//printf("address and lr and sp and sptemp and spreal is : 0x%08x , 0x%08x , 0x%08x , 0x%08x , 0x%08x \n", addr, lr , sp , sptemp, spreal);
	//printf("address and lr and sp and sptemp is : 0x%08x , 0x%08x , 0x%08x , 0x%08x \n", addr, lr , sp , sptemp);
	//printf("The value of shift %u and bytes %u and ERR %i and length 0x%08x \n", shift, bytes , ERR , *length);
	
	
	uint64_t ret = 0;
	///printf("fixed patch %s is here and its location is 0x%08x !\n", patch->desc->cve , patch->desc->fixed_id);
	
	///profile_add_event("EV0");
   	///profile_start(EV0);
	// ret = patch->desc->func(sptemp);//For evaluating patch code executin delay, we have to put "profile" around this, I think. 
    	///profile_end(EV0);
    	///profile_dump(EV0);

	
	
	//profile_add_event("EV1");
	//profile_start(EV1);
	//ret = patch_cve_10062(sptemp);
	//profile_end(EV1);
	//profile_dump(EV1);

	
	uint32_t op = ret >> 32;
	//printf("op code:0x%08x \n", op);
	uint32_t ret_code = ret & 0x00000000ffffffff;
	//printf("ret code:0x%08x \n", ret_code);
	
	//********//
	//FILTER_PASS 0
	//FILTER_DROP 1
	//FILTER_REDIRECT 2
	
	
	if (op == FILTER_DROP) {
		*(volatile uint32_t *) &(args->r0_1) = 0; 
		//printf("FILTER_DROP\n");
		return;
	} else if (op == FILTER_REDIRECT) {
		*(volatile uint32_t *) (args->lr) = ret_code;//I doesnot work! What is this? How can we implement for redirect part?
		//printf("FILTER_REDIRECT\n");
		return;
	} else { // FILTER_PASS
		*(volatile uint32_t *) &(args->r0_1) = FIXED_OP_PASS;
		// printf("FILTER_PASS\n");
		return;
	}

}

//inline uint64_t set_return(uint64_t op, uint64_t ret_code) {
//uint64_t set_return(uint64_t op, uint64_t ret_code) {
//	return (op << 32) + ret_code;
//}


//CVE-2020-10062
//uint64_t patch_cve_10062(uint32_t sp){
//	uint32_t op = FILTER_PASS;
//	uint32_t ret_code = 0;
	
//	uint8_t shift = *(uint32_t *) (sp + 15);
//	uint8_t bytes = *(uint32_t *) (sp + 14);
//	int ERR = *(uint32_t *) (sp + 8);
//	uint32_t *length = *(uint32_t *) (sp + 0);
//	struct dummy_MQTT_buf_ctx *buf = *(uint32_t *)(sp + 4);
	
	//printf("The value of shift %u and bytes %u and ERR %i and length 0x%08x and buf->cur %u \n", shift, bytes , ERR , *length, *(buf->cur));
	//printf("The value of shift %u and bytes %u and ERR %i and length 0x%08x \n", shift, bytes , ERR , *length);
	
//	if(bytes >= 4){
//		op = 1;
//		ret_code = -22;
//	}
	
//	return set_return(op, ret_code);
//}

//CVE-2020-10062
static int dummy_buggy_MQTT_packet_length_decode(struct dummy_MQTT_buf_ctx *buf, uint32_t *length)
{
	// PATCH_FUNCTION_ERR_CODE;

    uint8_t shift = 0U;
    uint8_t bytes = 0U;
    int ERR = -1;
    *length = 0U;
    ///profile_add_event("EV0");
    ///profile_start(EV0);
    ///profile_end(EV0);
    ///profile_dump(EV0);
    
    do {	
    		///profile_add_event("EV0");
		///profile_start(EV0);
       		///PATCH_FUNCTION_ERR_CODE;
       		///profile_end(EV0);
		///profile_dump(EV0);
		
		if (bytes > 4) {
			return ERR;
		}

		if (buf->cur >= buf->end) {
			return ERR;
		}
		*length += ((int)*(buf->cur) & 0x7f) << shift;
		shift += 7;
		bytes++;
	} while ((*(buf->cur++) & 0x80) != 0U);
	
    PATCH_FUNCTION_ERR_CODE;
    
    //printf("dummy MQTT packet length:0x%08x \n", *length);
    return 0;
}
static void call_dummy_buggy_MQTT_function() {

	uint8_t packet_buf[10];
	
	for (int i=0; i<4; ++i) packet_buf[i] = 0xff;
	packet_buf[4] = 0x7f;
	for (int i=5; i<10; ++i) packet_buf[i] = 0;

	struct dummy_MQTT_buf_ctx dbc;
	dbc.cur = &packet_buf[0];
	dbc.end = &packet_buf[9];	
	
	uint32_t pkt_length = 0;
	
	profile_add_event("EV0");
	profile_start(EV0);
	int ret = dummy_buggy_MQTT_packet_length_decode(&dbc, &pkt_length);//Like RapidPatch, we can say our patch loading delay depends on input, we run the vulnerable function with different inputs and calculate the average delay.	
	profile_end(EV0);
	profile_dump(EV0);
	
	printf("Decoded MQTT packet length is %d\n", pkt_length);

	
	//if (pkt_length != 0) {
	//	printf("is still vulnerable!\n\n");
	//} else {
	//	printf("is fixed!\n");
	//}
	if (pkt_length == -1) {
		printf("is still vulnerable!\n\n");
	} else {
		printf("is fixed!\n");
	}
	
}



uint64_t set_return_main(uint64_t op, uint64_t ret_code) {
	return (op << 32) + ret_code;
}

//CVE-2020-10063
static inline bool u16_add_overflow_patch(uint16_t a, uint16_t b, uint16_t *result){
	uint16_t c = a + b;
	///printf("c: %d and a:%d \n", c, a);
	*result = c;///Fix it
	///printf("Ey khoda \n");
	return c < a; }
//one place
//Rapid Patch is so bad!
uint64_t patch_cve_10063(stack_frame *sp){
	uint32_t op = FILTER_PASS;
	uint32_t ret_code = 0;
	uint32_t data = sp->r1;//beggining of address of testcase array
	uint16_t *opt_delta = *(uint16_t *) (data + 0);
 	uint16_t delta = *(uint16_t *) (data + 1);
 	uint16_t *opt_len = *(uint16_t *) (data + 4);
 	uint16_t len = *(uint16_t *) (data + 5);
	///printf("data: 0x%08x delta: %d and len:%d \n", data, delta, *opt_delta);
   	if (u16_add_overflow_patch(*opt_delta, delta, opt_delta) ||
	    u16_add_overflow_patch(*opt_len, len, opt_len)) {
	    	///printf("Here!\n");
        	op = 1;
        	ret_code = -EINVAL;
    	}
    	///printf("Or Here!\n");
	return set_return_main(op, ret_code);
}

//**********//


//CVE-2020-10024
uint64_t patch_cve_10024(stack_frame *sp){
	uint32_t op = FILTER_PASS;
	uint32_t ret_code = 0;

	//printf("Hello, continue!\n");
	K_APP_BMEM(part0) static volatile bool expect_fault = true;
	K_APP_BMEM(part0) static volatile unsigned int expected_reason = K_ERR_KERNEL_OOPS;
	if(arch_is_user_context()){
		//printf("WOW... \n");
	}else{
		//printf("WOW2... \n");
	}
	//arch_syscall_invoke0(UINT_MAX);
	//printf("Hello, END!\n");
	return set_return_main(op, ret_code);
}

//CVE-2020-10028
uint64_t patch_cve_10028(stack_frame *sp){
	uint32_t op = FILTER_PASS;
	uint32_t ret_code = 0;
	printf("Hello, Start1!\n");

	//uint32_t *ptr_addr = (uint32_t *)(sp->r0);

	//struct device *port = (struct device *) (*ptr_addr);
	struct device *dev;
	printf("Hello, Start!\n");

	//Z_OOPS(Z_SYSCALL_DRIVER_KSCAN(dev, enable_callback));
	printf("Hello, End!\n");

}

// void test_ebpf_c5() {
// 	// zephyr_cve_2020_10028
// 	stack_frame sf;
	
// 	uint64_t ret1 = 0;
// 	printf("Hello, Start0!\n");

// 	struct device *port;
// 	port->name = 'M';
// 	sf.r0 = &port;


// 	//profile_add_event("EV0");
// 	//profile_start(EV0);
// 	printf("Hello, Start2!\n");
// 	ret1 = patch_cve_10028(&sf);
// 	//printf("Hello, End!\n");
// 	//profile_end(EV0);
// 	//profile_dump(EV0);
// }


//CVE-2020-10021
#define BLOCK_SIZE	512
/*current CBW*/
static struct CBW cbw;
/*CSW which will be sent*/
static struct CSW csw;
/*addr where will be read or written data*/
static uint32_t addr;
/*length of a reading or writing*/
static uint32_t length;

/* CSW Status */
enum Status {
	CSW_PASSED,
	CSW_FAILED,
	CSW_ERROR,
};

#define MSD_OUT_EP_IDX			0
#define MSD_IN_EP_IDX			1

static void mass_storage_bulk_out(uint8_t ep,
				  enum usb_dc_ep_cb_status_code ep_status);
static void mass_storage_bulk_in(uint8_t ep,
				 enum usb_dc_ep_cb_status_code ep_status);
#define MASS_STORAGE_IN_EP_ADDR		0x82
#define MASS_STORAGE_OUT_EP_ADDR	0x01

/* Describe EndPoints configuration */
static struct usb_ep_cfg_data mass_ep_data[] = {
	{
		.ep_cb	= mass_storage_bulk_out,
		.ep_addr = MASS_STORAGE_OUT_EP_ADDR
	},
	{
		.ep_cb = mass_storage_bulk_in,
		.ep_addr = MASS_STORAGE_IN_EP_ADDR
	}
};

static uint32_t memory_size = 233;


static bool dummy_CVE_2020_10021_infoTransfer(void)
{
	uint32_t n;
	PATCH_FUNCTION_ERR_CODE;
	
	
	/* Logical Block Address of First Block */
	n = (cbw.CB[2] << 24) | (cbw.CB[3] << 16) | (cbw.CB[4] <<  8) |
				 (cbw.CB[5] <<  0);

	printf("LBA (block) : 0x%x \n", n);
	printf("cbw.CB[2] and block-size is : %u and %u \n", cbw.CB[2], BLOCK_SIZE);
	
	// This is patch
	if ((n * BLOCK_SIZE) >= memory_size) {
	 	printf("LBA out of range \n");
	 	csw.Status = CSW_FAILED;
	 	//sendCSW();
	 	return false;
	 }

	addr = n * BLOCK_SIZE;

	/* Number of Blocks to transfer */
	switch (cbw.CB[0]) {
	case READ10:
	case WRITE10:
	case VERIFY10:
		n = (cbw.CB[7] <<  8) | (cbw.CB[8] <<  0);
		break;
	case READ12:
	case WRITE12:
		n = (cbw.CB[6] << 24) | (cbw.CB[7] << 16) |
			(cbw.CB[8] <<  8) | (cbw.CB[9] <<  0);
		break;
	}
	///PATCH_FUNCTION_ERR_CODE;
	//printf("Size (block) : 0x%x \n", n);
	length = n * BLOCK_SIZE;
	if (!cbw.DataLength) {              /* host requests no data*/
		printf("Zero length in CBW \n");
		csw.Status = CSW_FAILED;
		//sendCSW();
		return false;
	}
	if (cbw.DataLength != length) {
		if ((cbw.Flags & 0x80) != 0U) {
			printf("Stall IN endpoint \n");
			//usb_ep_set_stall(mass_ep_data[MSD_IN_EP_IDX].ep_addr);
		} else {
			printf("Stall OUT endpoint \n");
			//usb_ep_set_stall(mass_ep_data[MSD_OUT_EP_IDX].ep_addr);
		}
		csw.Status = CSW_FAILED;
		//sendCSW();
		return false;
	}
	///PATCH_FUNCTION_ERR_CODE;
	return true;
}

void call_dummy_CVE_2020_10021_infotransfer(){
	// setup test arguments 8002df8 - 8002dec

	int bl_addr = (uint32_t) dummy_CVE_2020_10021_infoTransfer + 11;
	printf("addr ground-truth bug:0x%08x test:0x%08x \n", bl_addr, call_dummy_CVE_2020_10021_infotransfer);
	
	
	// Prepare invocation context for the buggy function
	// Zephyr_cve_2020_10021
	cbw.CB[0] = READ10;
	// cbw.CB[2] = 1;


	///profile_start(0);
	bool ret = dummy_CVE_2020_10021_infoTransfer();
	///profile_end(0);
	///profile_dump(0);
	
	printf("The return code of the buggy function is %d\n", ret);
}


void blinksample(void)
{
	profile_add_event("EV0");
	profile_start(EV0);

	int ret;
	int i =0;
	// PATCH_FUNCTION_ERR_CODE;
	if (!gpio_is_ready_dt(&led)) {
		return;
	}

	ret = gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE);
	// PATCH_FUNCTION_ERR_CODE;
	if (ret < 0) {
		return;
	}

	while (i < 10) {
		// PATCH_FUNCTION_ERR_CODE;
		ret = gpio_pin_toggle_dt(&led);
		// PATCH_FUNCTION_ERR_CODE;
		if (ret < 0) {
			return;
		}
		k_msleep(SLEEP_TIME_MS);
		// PATCH_FUNCTION_ERR_CODE;
		i++;
	}
	// PATCH_FUNCTION_ERR_CODE;
	profile_end(EV0);
	profile_dump(EV0);
}

void printstr (){
	profile_add_event("EV0");
	profile_start(EV0);
	// printf("Hello world! \n");
	// printf("Hello World, I am AutoPatch!\n");
	
	PATCH_FUNCTION_ERR_CODE;
	profile_end(EV0);
	profile_dump(EV0);
}

///////////////////**********************///////////////////////


// Simple hash function for hexadecimal addresses
size_t hash_function(uint64_t address) {
    // Extract the lower 32 bits of the address
    uint32_t lower_bits = (uint32_t)(address & 0xFFFFFFFF);
    // XOR the lower and upper 32 bits of the address
    uint32_t upper_bits = (uint32_t)((address >> 32) ^ lower_bits);
    // Use the XOR of the lower and upper bits as the hash value
    size_t hash = (size_t)(lower_bits ^ upper_bits);
    // Modulo the hash value by the size of the hash array (64)
    return hash % 64;
}


// Define the function type for the patch functions
typedef uint64_t (*patch_func_t)(struct stack_frame *);

// Define the struct for hashmap entry
typedef struct {
    uint32_t address; // The address key
    patch_func_t patch_func; // The patch function value
    struct hashmap_entry_t* next; // Pointer to the next entry in the bucket's linked list
} hashmap_entry_t;

// Define the hashmap type
typedef struct {
    size_t num_buckets; // Number of buckets
    hashmap_entry_t** buckets; // Array of pointers to entries
} hashmap_t;


typedef struct {
    uint32_t address; // The address key
    patch_func_t patch_func; // The patch function value
} hashmap_new;



// Binary search to find a patch function based on address
patch_func_t find_patch_function(hashmap_new *patches, int num_patches, uint32_t address) {
    int left = 0;
    int right = num_patches - 1;

    while (left <= right) {
        int mid = (left + right) / 2;
        if (patches[mid].address == address) {
            return patches[mid].patch_func;
        } else if (patches[mid].address < address) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }

    return NULL; // Patch function not found
}

// Function to insert a new element into the structure
void insert_patch_function(hashmap_new *patches, int *num_patches, uint32_t address, patch_func_t patch_func) {
    // Find the index where the new element should be inserted using binary search
    int index = *num_patches;
    for (int i = 0; i < *num_patches; i++) {
        if (patches[i].address > address) {
            index = i;
            break;
        }
    }

    // Shift elements to the right to make space for the new element
    for (int i = *num_patches; i > index; i--) {
        patches[i] = patches[i - 1];
    }

    // Insert the new element
    patches[index].address = address;
    patches[index].patch_func = patch_func;

    (*num_patches)++; // Increment the number of patches
	printf("Inserting is successful %d \n" , *num_patches);
}




// Declare the external patch functions
// extern uint64_t filter_CVE_10021(struct stack_frame *frame);
extern uint64_t filter(struct stack_frame *frame);
// ... (declare more external patch functions here)

// Initialize the hashmap with buckets
hashmap_t* hashmap_init(size_t num_buckets) {
    hashmap_t* map = (hashmap_t*)malloc(sizeof(hashmap_t));
    map->num_buckets = num_buckets;
    map->buckets = (hashmap_entry_t**)calloc(num_buckets, sizeof(hashmap_entry_t*));
    return map;
}

// Insert an entry into the hashmap
void hashmap_insert(hashmap_t* map, uint32_t address, patch_func_t patch_func) {
    size_t hash = hash_function(address); // Compute hash value
    size_t bucket_idx = hash % map->num_buckets; // Compute bucket index
    hashmap_entry_t* new_entry = (hashmap_entry_t*)malloc(sizeof(hashmap_entry_t)); // Allocate memory for new entry
    new_entry->address = address;
    new_entry->patch_func = patch_func;
    new_entry->next = map->buckets[bucket_idx]; // Insert at the beginning of the bucket's linked list
    map->buckets[bucket_idx] = new_entry;
}

// Search for a patch function based on an address
//patch_func_t search_patch_function(uint64_t address, hashmap_t* map) {
patch_func_t search_patch_function(size_t hash, uint32_t address, hashmap_t* map) {

    // size_t hash = hash_function(address); // Compute hash value
    size_t bucket_idx = hash % map->num_buckets; // Compute bucket index

    // Search for the patch function in the bucket's linked list
    hashmap_entry_t* entry = map->buckets[bucket_idx];
    while (entry != NULL) {
        if (entry->address == address) {
            return entry->patch_func; // Found the patch function, return it
        }
        entry = entry->next; // Move to the next entry in the bucket
    }

    return NULL; // Patch function not found in the hashmap
}





// Overhead for Dispatcher
struct patch_list {
	arraymap *patches;
};

void patch_num_eva(struct patch_list *plist, int n, int times) {
	if (plist->patches == NULL) {
		plist->patches = arraymap_new(72);
	}
	for (int i = 0; i < n; i++) {
		arraymap_set(plist->patches, i, 1);
	}
	dwt_init();
	int start = get_cur_tick();
	for (int t = 0; t < times; t++) {
		for (int i = 0; i < n; i++) {
			int val = arraymap_get(plist->patches, i);
			(void) val;
		}
	}
	int cycles = get_cur_tick() - start;
	int microseconds_per_iteration = (int)(cycles2us(cycles / times / n) * 100);

  	printf("patch_numbers: %d time: %d.%02d cycles: %d\n", n, microseconds_per_iteration / 100, cycles);
}

void test_patch_dispatcher(){
	// setup patch list
	printf("**Evaluating Hotpatch Dispatching Overhead** \n");
	profile_add_event("EV0");
	profile_start(EV0);
	profile_end(EV0);
	profile_dump(EV0);
	struct patch_list plist;
	plist.patches = NULL;
	int TI = 100;
	for (int i = 1; i < 65; i += 4) {
		patch_num_eva(&plist, i, TI);
	}
	patch_num_eva(&plist, 64, TI);
	arraymap_destroy(plist.patches);
}
//******** END of Dispatcher Overhead ********//


// extern uint64_t filter(stack_frame *frame);
// extern uint64_t info(stack_frame *frame);
extern uint64_t filter_10021(stack_frame *frame);
extern uint64_t filter_10063(stack_frame *frame);
extern uint64_t filter_10062_1(stack_frame *frame);
extern uint64_t filter_10062_2(stack_frame *frame);
extern uint64_t filter_10024(stack_frame *frame);
extern uint64_t filter_10028(stack_frame *frame);
extern uint64_t filter_16524(stack_frame *frame);
extern uint64_t filter_16603(stack_frame *frame);
extern uint64_t filter_17443(stack_frame *frame);
extern uint64_t filter_17445(stack_frame *frame);
extern uint64_t filter_10023(stack_frame *frame);

extern uint64_t filter_16522(stack_frame *frame);
extern uint64_t filter_16526(stack_frame *frame);
extern uint64_t filter_16525(stack_frame *frame);
extern uint64_t filter_16599(stack_frame *frame);
extern uint64_t filter_16523(stack_frame *frame);
extern uint64_t filter_16602(stack_frame *frame);
extern uint64_t filter_16600(stack_frame *frame);
extern uint64_t filter_16602(stack_frame *frame);
extern uint64_t filter_16527(stack_frame *frame);
extern uint64_t filter_16598(stack_frame *frame);
extern uint64_t filter_14199(stack_frame *frame);
extern uint64_t filter_10019(stack_frame *frame);



void main(){

	printf("Hello, Welcome to AutoPatch Artifact! This is the config of board: %s\n", CONFIG_BOARD);
	
	// For Patch Dispatching Delay
	// test_patch_dispatcher();

	
	// Board CPU Frequency Information
	// uint32_t cpu_freq = sys_clock_hw_cycles_per_sec();
   	// printf("CPU Frequency: %u Hz\n", cpu_freq);


	
	//For Patch Exectution Time:
	
	// test_c1(); //CVE-2020-10063
	// test_c2(); //CVE-2020-10021
	// test_c3(); //CVE_2020_10024
	// test_c4(); //CVE_2020_10028
	// test_c5(); //CVE-2020-10062
	// test_c6(); //CVE-2018-16524
	// test_c7(); //CVE-2018-16528
	// test_c8(); //CVE-2018-16603
	// test_c9(); //CVE-2018-2784
	// test_c10(); //CVE-2020-17443
	// test_c11(); //CVE-2020-17445
	// test_c12(); //CVE-2020-10023

	// NEW CVES:

	// test_c13(); //CVE-2018-16522
	// test_c14(); //CVE-2018-16526
	// test_c15(); //CVE-2018-16525
	// test_c16(); //CVE-2018-16599
	// test_c17(); //CVE-2018-16523
	// test_c18(); //CVE-2018-16602
	// test_c19(); //CVE-2018-16600
	// test_c20(); //CVE-2018-16527
	// test_c21(); //CVE-2018-16598
	// test_c22(); //CVE-2017_14199
	// test_c23(); //CVE-2020-10019
	// test_c24(); //CVE-2020-10060
	// test_c25(); //CVE-2020-10061
	// test_c26(); //CVE-2020-10066
	test_c27(); //CVE-2020-10067
	// test_c28(); //CVE-2020-10069
	// test_c29(); //CVE-2020-10070
	// test_c30(); //CVE-2020-10071
	// test_c31(); //CVE-2020-13602
	// test_c32(); //CVE-2021-3336
	// test_c33(); //CVE-2020-24338
	// test_c34(); //CVE-2020-17442
	// test_c35(); //CVE-2020-13600
	// test_c36(); //CVE-2019_16748

	////*** End of execution time evaluation ***////

	
	// test_ebpf_c1();
	// test_ebpf_c2();
	// test_ebpf_c3();
	// test_ebpf_c4();
	// test_ebpf_c5();
	// test_ebpf_c6();
	// test_ebpf_c7();
	// test_ebpf_c8();
	// test_ebpf_c9();
	// test_ebpf_c10();
	// test_ebpf_c11();
	// test_ebpf_c12();


	// printf("Hello, Begin!\n");
	// profile_add_event("EV0");
	// profile_start(EV0);
	// fixed_patch_point_hanlder();
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, Begin!\n");

	// profile_add_event("EV0");
	// profile_start(EV1);
	// stack_frame st_frame;
	// st_frame.r0 = 0;
	// // uint64_t t = filter(&st_frame);
	// // uint64_t result = filter_2020_10021(&st_frame);
	// uint64_t result = filter_10063(&st_frame);
	// profile_end(EV1);
	// profile_dump(EV1);

	// Evaluating "printf":
	// profile_add_event("EV0");
	// profile_start(EV0);
	// printf("Hello World, I am AutoPatch!\n");
	// profile_end(EV0);
	// profile_dump(EV0);

	
 	// int num_patches = get_num_patches();
 	// printf("Number of patches stored before: %d\n", num_patches);
	// load_local_fixed_patch(0);
	// call_dummy_buggy_MQTT_function();

	///load_local_fixed_patch(1);
	// call_dummy_CVE_2020_10021_infotransfer();	


	////////////////////////*********************************************/////////////////////////////////////

	// hashmap_new patches[25];
	// int num_patches = 0;

	// // Insert patch function 1
    	// patches[num_patches].address = 0x00001921;
   	// patches[num_patches].patch_func = filter; // Set the patch function pointer accordingly
    	// num_patches++;

	// insert_patch_function(patches, &num_patches, 0x00001922, filter);
	// insert_patch_function(patches, &num_patches, 0x00001923, filter);
	// insert_patch_function(patches, &num_patches, 0x00001924, filter);
	// insert_patch_function(patches, &num_patches, 0x00001925, filter);
	// insert_patch_function(patches, &num_patches, 0x00001926, filter);
	// insert_patch_function(patches, &num_patches, 0x00001927, filter);
	// insert_patch_function(PATCH_FUNCTION_ERR_CODEpatches, &num_patches, 0x00001928, filter);
	// insert_patch_function(patches, &num_patches, 0x00001929, filter);
	// insert_patch_function(patches, &num_patches, 0x00001930, filter);
	// insert_patch_function(patches, &num_patches, 0x00001931, filter);
	// insert_patch_function(patches, &num_patches, 0x00001932, filter);
	// insert_patch_function(patches, &num_patches, 0x00001933, filter);
	// insert_patch_function(patches, &num_patches, 0x00001934, filter);
	// insert_patch_function(patches, &num_patches, 0x00001935, filter);
	// insert_patch_function(patches, &num_patches, 0x00001936, filter);
	// insert_patch_function(patches, &num_patches, 0x00001937, filter);
	// insert_patch_function(patches, &num_patches, 0x00001938, filter);
	// insert_patch_function(patches, &num_patches, 0x00001939, filter);
	// insert_patch_function(patches, &num_patches, 0x08001940, filter);
	// insert_patch_function(patches, &num_patches, 0x08001941, filter);
	// insert_patch_function(patches, &num_patches, 0x08001942, filter);
	// insert_patch_function(patches, &num_patches, 0x0800db11, filter);
	// insert_patch_function(patches, &num_patches, 0x0800de08, filter);
	// insert_patch_function(patches, &num_patches, 0x08002000, filter);

	// Insert patch function 2
    	// patches[num_patches].address = 0x00001924;
    	// patches[num_patches].patch_func = filter; // Set the patch function pointer accordingly
    	// num_patches++;

	// // // Insert patch function 1
    	// patches[num_patches].address = 0x00001922;
    	// patches[num_patches].patch_func = filter; // Set the patch function pointer accordingly
    	// num_patches++;

    	// // // Insert patch function 2
    	// patches[num_patches].address = 0x00001923;
    	// patches[num_patches].patch_func = filter; // Set the patch function pointer accordingly
    	// num_patches++;

    	// // Find patch function based on address
    	// uint32_t address_to_find = 0x00001922;

	// profile_add_event("EV0");
	// profile_start(EV0);

    	// patch_func_t found_patch_func = find_patch_function(patches, num_patches, address_to_find);

	// profile_end(EV0);
	// profile_dump(EV0);

    	// if (found_patch_func != NULL) {
    	//     printf("Found patch function at address 0x%08x\n", address_to_find);
    	// } else {
    	//     printf("Patch function not found at address 0x%08x\n", address_to_find);
    	// }

    

	// ******************* HASH METHOD ***************  //

	// hashmap_t* map = hashmap_init(21); // Initialize hashmap with 16 buckets

    	// Insert entries into the hashmap
    	// hashmap_insert(map, 0x00001921, filter_CVE_10021);
	// hashmap_insert(map, 0x00001921, filter);
	// hashmap_insert(map, 0x00001924, filter);
	// hashmap_insert(map, 0x00001926, filter);
	// hashmap_insert(map, 0x00001928, filter);
	// hashmap_insert(map, 0x00001929, filter);
	// hashmap_insert(map, 0x00001910, filter);
	// hashmap_insert(map, 0x00001911, filter);
	// hashmap_insert(map, 0x00001912, filter);
	// hashmap_insert(map, 0x00001913, filter);
	// hashmap_insert(map, 0x00001914, filter);
	// hashmap_insert(map, 0x00001915, filter);
	// hashmap_insert(map, 0x00001916, filter);
	// hashmap_insert(map, 0x00001917, filter);
	// hashmap_insert(map, 0x00001918, filter);
	// hashmap_insert(map, 0x00001919, filter);
	// hashmap_insert(map, 0x00001920, filter);
	// hashmap_insert(map, 0x00001925, filter);
	// hashmap_insert(map, 0x00001918, filter);
	// hashmap_insert(map, 0x00001919, filter);
	// hashmap_insert(map, 0x00001920, filter);
	// hashmap_insert(map, 0x00001925, filter);

        // ... (TODO: add more entries here)

   	// Get the patch function from the hashmap based on the address
    	// struct stack_frame st_frame;
    	// Initialize the stack frame
        // ... (set values for the stack frame members)

   	// uint32_t address = 0x00001921; // Example address

	// size_t hash = hash_function(address); // Compute hash value

	// profile_add_event("EV1");
	// profile_start(EV1);

	// patch_func_t patch_func = search_patch_function(hash , address, map);
	
	// profile_end(EV1);
	// profile_dump(EV1);

    	// if (patch_func != NULL) {
     		// Call the patch function with the stack frame
		// printf("The patch is Found! \n");
   		// patch_func(&st_frame);
    	// }else{
	// 	printf("The patch is not Found! \n");
	// }
}

void test_c1() {
	/*
	zephyr_cve_2020_10063
	*/
	printf("Start the evaluation process!\n");
	unsigned char testcase[] = {
		0, 0, 0, 0,
		0x0E, /* delta=0, length=14 */ // COAP_OPTION_EXT_14 = 14
		0xFE, 0xF0, /* First option */
		0x00 /* More data following the option to skip the "if (r == 0) {" case */
	};
	// uint8_t mem[48];
	stack_frame sf;
	//args_frame.r0 = (uint32_t) testcase;
	//sf.r1 = (uint32_t) testcase;
	//sf.r2 = 500;

	sf.r0 = 10;

	// memcpy(mem, &args_frame, sizeof(args_frame));
	// uint32_t addr = sf.r1;
	// printf("addr: 0x%08x 0x%08x val: %d\n", addr, testcase + 5, *(uint16_t *)(addr + 5));
	// DEBUG_LOG("test_ebpf_c1: 0x%08x 0x%08x 0x%08x %d\n", &args_frame, args_frame.r1, testcase, sizeof(args_frame));
	// DEBUG_LOG("struct size: %p %p %p\n", &args_frame, &(args_frame.r1), &(args_frame.r2));
	uint64_t ret1 = 0;
	

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10063(&sf);
		total += profile_end(EV0);
	}
	

	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_10063(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");
}

void test_c5() {
	/*
	zephyr_cve_2020_10062
	*/
	// printf("Start the evaluation process!\n");
	
	stack_frame sf;
	sf.r0 = 1;
	uint64_t ret1 = 0;



	// uint32_t total = 0;
	// profile_add_event("EV0");
	// for (int i = 0; i < 1000; i++)
	// {
	// 	profile_start(EV0);
	// 	// ret1 = filter_10062_1(&sf);
	// 	total += profile_end(EV0);
	// }
	
	
	// //profile_dump(EV0);
	// printf("Hello, End! total is : %d \n", total);

	
	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_10062_1(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");

	uint32_t testcase = 268435456; //Malicious input
	// // uint32_t testcase = 1; //Normal input
	sf.r0 = testcase;

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10062_2(&sf);
		total += profile_end(EV0);
	}
	
	
	//profile_dump(EV0);
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	
	// profile_add_event("EV1");
	// profile_start(EV1);
	// ret1 = filter_10062_2(&sf);
	// profile_end(EV1);
	// profile_dump(EV1);
	// printf("Hello, End!\n");
}

void test_c2() {
	/*
	zephyr_cve_2020_10021
	*/
	// printf("Start the evaluation process!\n");
	
	stack_frame sf;
	sf.r0 = 10; // n
	sf.r1 = 1024; // memory_size
	uint64_t ret1 = 0;
	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10021(&sf);
		total += profile_end(EV0);
	}
	
	
	//profile_dump(EV0);
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// uint32_t testcase = 268435456; //Malicious input
	// // uint32_t testcase = 1; //Normal input
	// sf.r0 = testcase;
	// profile_add_event("EV1");
	// profile_start(EV1);
	// ret1 = filter_10062_2(&sf);
	// profile_end(EV1);
	// profile_dump(EV1);
	// printf("Hello, End!\n");
}

void test_c3() {
	/*
	zephyr_cve_2020_10024
	*/
	
	// printf("Start the evaluation process!\n");
	
	stack_frame sf;
	// sf.pc = 5;
	// sf.xpsr = 7;
	uint64_t ret1 = 0;
	sf.r0 = 0;
	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10024(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_10024(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");


}

void test_c4(){
	/*
	zephyr_cve_2020_10028
	*/

	// printf("Start the evaluation process!\n");

	static struct gpio_struct2 {
		int a;
		int b;
		int c;
		int d;
		int *e;
	};

	static struct gpio_struct1 {
		struct gpio_struct2* a;
	};
	struct gpio_struct2 g2 = {
		.a = 0,
		.b = 0,
		.c = 0,
		.d = 0,
		.e = 0,
	};

	struct gpio_struct1 g1 = {
		.a = &g2,
	};

	stack_frame sf = {
		.r0 = &g1,
		.r1 = 2,
		.r2 = 0,
		.r3 = 1,
		.r12 = 0,
		.lr = 0,
		.pc = 0,
		.xpsr = 0,
	};

	uint64_t ret1 = 0;

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10028(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_10028(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");

}

void test_c6() {
	/*
	freertos_cve_2018_16524
	*/
	
	// printf("Start the evaluation process!\n");

	
	uint64_t ret1 = 0;
	uint8_t pxLength = 10;

	static struct IPPacket {
		unsigned char padd[24];
		unsigned char *tcpptr;
		uint8_t xDataLength;
	};

	static struct TCPPacket {
		unsigned char data[60];
	};

	struct TCPPacket tcppkt = {
		.data = {0},
	};

	struct IPPacket ippkt = {
		.padd = {0},
		.tcpptr = &tcppkt,
		.xDataLength = 1
	};

	stack_frame sf = {
		//.r0 = &pxLength, //When it has "printf", you should store into r1 for pxNBDL
		.r0 = &ippkt,
		// .r2 = &pxLength, //When it doesn't have "printf", you should store into r2 for pxNBDL
	};

	// printf("Hello %p %p %p %p\n", &ippkt , &(ippkt.tcpptr) , *(ippkt.tcpptr), &(ippkt.xDataLength));

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16524(&sf);
		total += profile_end(EV0);
	}
	
	
	//profile_dump(EV0);
	printf("Evaluation result for 1000 execution! total is : %d \n", total);



	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_16524(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");
}

void test_c7() {
	/*
	freertos_2018_16528
	*/
	
	// printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	stack_frame sf = {
		.r0 = 15,
		.r1 = 2
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16528_1(&sf);
		ret1 = filter_16528_2(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_16528_1(&sf);
	// // ret1 = filter_16528_2(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");


}

void test_c8() {
	/*
	freertos_cve_2018_16603
	*/
	// printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct ETHPacket {
		unsigned char padd[28];
		uint64_t xDataLength;
	};
	struct ETHPacket ethpkt = {
		.padd = {0},
		.xDataLength = 50,
	};

	stack_frame sf = {
		.r0 = &ethpkt
	};

	// printf("Hello %p %p \n", &ethpkt , &(ethpkt.xDataLength) );

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16603(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_16603(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");
}

void test_c9() {
	/*
	mbedTLS_cve_2017_2784
	*/
	
	// printf("Start the evaluation process!\n");

	uint64_t ret1 = 0;
	stack_frame sf = {
		.pc = 2020
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_2784(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_2784(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");
}


void test_c10() {
	/*
	AMNESIA33_cve_2020_17443
	*/
	
	// printf("Start the evaluation process!\n");

	uint64_t ret1 = 0;
	static struct PicoFrame {
		unsigned char padd[38];
		uint16_t transport_len;
	};
	struct PicoFrame pf = {
		.padd = {0},
		.transport_len = 8,
	};
	stack_frame sf = {
		.r0 = &pf,
	};

	//printf("Hello %p %p \n", &ethpkt , &(ethpkt.xDataLength) );

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_17443(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);


	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_17443(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");
}

void test_c11() {
	/*
	AMNESIA33_cve_2020_17445
	*/
	
	// printf("Start the evaluation process!\n");

	uint64_t ret1 = 0;
	uint32_t opt_ptr = 2;
	uint8_t destopt[50] = {1, -2, -2, -2, -2, -2}; //You should change the optlen value which is the fourth element (e.g., {1, -2, -2, 1, -2, -2})
	uint8_t len = 10;
	uint8_t *option = ( (uint8_t*) destopt + 2);

	stack_frame sf = {
		.r0 = opt_ptr,
		.r1 = option,
		.r2 = len,
	};

	// printf("Hello %d %p \n", *option , option);

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_17445(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);


	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_17445(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");

}

void test_c12() {
	/*
	zephyr_cve_2020_10023
	*/
	
	// printf("Start the evaluation process!\n");

	
	uint64_t ret1 = 0;
	char *test_str = "test\n";
	uint16_t len = 5;
	uint16_t shift = 0;
	int i = 0;
	int j = 0;


	stack_frame sf = {
		.r0 = test_str,
		.r1 = len,
		.r2 = shift,
		.r3 = i,
	};

	//printf("Hello %p %p \n", &ethpkt , &(ethpkt.xDataLength) );

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10023(&sf);
		total += profile_end(EV0);
	}

	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

	// profile_add_event("EV0");
	// profile_start(EV0);
	// ret1 = filter_10023(&sf);
	// profile_end(EV0);
	// profile_dump(EV0);
	// printf("Hello, End!\n");


}

/////////////////////*NEW CVEs*////////////////////////////////
void test_c13() {
	/*
	freertos_cve_2018_16522
	*/
	
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t pxLength = 10;
	static struct IPPacket {
		unsigned char padd[24];
		unsigned char *tcpptr;
		uint8_t xDataLength;
	};

	static struct TCPPacket {
		unsigned char data[60];
	};

	struct TCPPacket tcppkt = {
		.data = {0},
	};

	struct IPPacket ippkt = {
		.padd = {0},
		.tcpptr = &tcppkt,
		.xDataLength = 1
	};

	stack_frame sf = {
		//.r0 = &pxLength, //When it has "printf", you should store into r1 for pxNBDL
		.r0 = &ippkt,
		// .r2 = &pxLength, //When it doesn't have "printf", you should store into r2 for pxNBDL
	};

	// printf("Hello %p %p %p %p\n", &ippkt , &(ippkt.tcpptr) , *(ippkt.tcpptr), &(ippkt.xDataLength));

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16522(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c14() {
	/*
	freertos_cve_2018_16526
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct PicoFrame {
		unsigned char padd[38];
		uint8_t versionHeader_len;
	};
	struct PicoFrame pf = {
		.padd = {0},
		.versionHeader_len = 8,
	};
	stack_frame sf = {
		.r0 = &pf,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16526(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}

void test_c15() {
	/*
	freertos_cve_2018_16525
	*/
	
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct PacketInfo {
		unsigned char padd[38];
		uint8_t versionHeader_len;
	};
	static struct NetworkBuffer {
		unsigned char padd[24];
		uint8_t DataLength;
	};

	struct PacketInfo pf = {
		.padd = {0},
		.versionHeader_len = 8,
	};
	struct NetworkBuffer nb = {
		.padd = {0},
		.DataLength = 8,
	};

	stack_frame sf = {
		.r0 = &pf,
		.r1 = &nb
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16525(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c16() {
	/*
	freertos_cve_2018_16599
	*/
	
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct NetworkBuffer {
		unsigned char padd[24];
		uint8_t DataLength;
	};

	struct NetworkBuffer nb = {
		.padd = {0},
		.DataLength = 8,
	};

	stack_frame sf = {
		.r0 = &nb
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16599(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}

void test_c17() {
	/*
	freertos_cve_2018_16523
	*/
	
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t pxLength = 10;
	static struct TCPHeader {
		unsigned char padd[24];
		unsigned char *tcpptr;
	};

	static struct TCPPacket {
		unsigned char data[60];
	};

	struct TCPPacket tcppkt = {
		.data = {0},
	};

	struct TCPHeader ippkt = {
		.padd = {0},
		.tcpptr = &tcppkt,
	};

	stack_frame sf = {
		.r0 = &ippkt,
	};

	// printf("Hello %p %p %p %p\n", &ippkt , &(ippkt.tcpptr) , *(ippkt.tcpptr), &(ippkt.xDataLength));

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16523(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}

void test_c18() {
	/*
	freertos_cve_2018_16602
	*/
	
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t LastByte = 5;
	uint8_t Byte = 0;
	

	stack_frame sf = {
		.r0 = LastByte,
		.r1 = Byte,
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16602(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c19() {
	/*
	freertos_cve_2018_16600
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct NetworkBuffer {
		unsigned char padd[24];
		uint8_t DataLength;
	};

	struct NetworkBuffer nb = {
		.padd = {0},
		.DataLength = 8,
	};

	stack_frame sf = {
		.r0 = &nb
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16600(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c20() {
	/*
	freertos_cve_2018_16527
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct NetworkBuffer {
		unsigned char padd[24];
		uint8_t DataLength;
	};

	struct NetworkBuffer nb = {
		.padd = {0},
		.DataLength = 8,
	};

	stack_frame sf = {
		.r0 = &nb
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16527(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
	
}
void test_c21() {
	/*
	freertos_cve_2018_16598
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	stack_frame sf = {
		.pc = 2020
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16598(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c22() {
	/*
	AMNESIA33_cve_2017_14199
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct UserData {
		unsigned char padd[24];
		uint8_t idx;
	};

	struct UserData ud = {
		.padd = {0},
		.idx = 8,
	};

	stack_frame sf = {
		.r0 = &ud
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_14199(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c23() {
	/*
	zephyr_cve_2020_10019
	*/
	
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint32_t len = 10;
	stack_frame sf = {
		.r0 = len,
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10019(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c24() {
	/*
	zephyros_cve_2020_10060
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct IPPacket {
		unsigned char padd[24];
		unsigned char *tcpptr;
		size_t objectsLength;
	};

	static struct TCPPacket {
		unsigned char data[60];
	};

	struct TCPPacket tcppkt = {
		.data = {0},
	};

	struct IPPacket ippkt = {
		.padd = {0},
		.tcpptr = &tcppkt,
		.objectsLength = 1
	};

	stack_frame sf = {
		.r0 = &ippkt,
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10060(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c25() {
	/*
	zephyros_cve_2020_10061
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t packet_head_offset = 10;
	uint8_t packet_head_len = 10;
	uint8_t pdu_data_len = 10;


	stack_frame sf = {
		.r1 = packet_head_offset,
		.r2 = packet_head_len,
		.r3 = pdu_data_len,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10061(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c26() {
	/*
	zephyros_cve_2020_10066
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	static struct NetworkBuffer {
		unsigned char padd[24];
		uint8_t ref;
		uint8_t flags;
		uint8_t pool_id;
		uint8_t data_size;
		unsigned char *memptr;

	};

	static struct NetworkBuffer_Simple {
		unsigned char data[60];
	};

	struct NetworkBuffer_Simple nbs = {
		.data = {0},
	};

	struct NetworkBuffer ippkt = {
		.padd = {0},
		.data_size = 1,
		.memptr = &nbs,
	};

	stack_frame sf = {
		.r0 = &ippkt,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10066(&sf);
		total += profile_end(EV0);
	}
	
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c27() {
	/*
	zephyros_cve_2020_10067
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint32_t Start = 5;
	uint32_t Size = 0;
	uint32_t *End = 0;

	stack_frame sf = {
		.r0 = Start,
		.r1 = Size,
		.r2 = End,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10067(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c28() {
	/*
	zephyr_cve_2020_10069
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t data_chan_count = 10;
	stack_frame sf = {
		.r0 = data_chan_count,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10069(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c29() {
	/*
	zephyros_cve_2020_10070
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint32_t length = 2;
	static struct buf_ctx {
		unsigned char *curptr;
		unsigned char *endptr;
	};

	static struct curPtr {
		unsigned char data[60];
	};

	struct curPtr CurPtr = {
		.data = {0},
	};

	static struct endPtr {
		unsigned char data[60];
	};

	struct curPtr EndPtr = {
		.data = {0},
	};

	struct buf_ctx ippkt = {
		.curptr = &CurPtr,
		.endptr = &EndPtr
	};

	stack_frame sf = {
		.r0 = &ippkt,
		.r1 = length
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10070(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}

void test_c30() {
	/*
	zephyr_cve_2020_10071
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint32_t varLength = 5;
	uint32_t varHeaderLength = 0;
	

	stack_frame sf = {
		.r0 = varLength,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_10071(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c31() {
	/*
	zephyr_cve_2020_13602
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t type = 2;
	

	stack_frame sf = {
		.r0 = type,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_13602(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c32() {
	/*
	wolfssl_cve_2021_3336
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t ret = 0;
	
	stack_frame sf = {
		.r0 = ret,
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_3336(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);
}
void test_c33() {
	/*
	picotcp_cve_2020_24338
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t *iterator;
	
	stack_frame sf = {
		.r0 = &iterator,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_24338(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c34() {
	/*
	freertos_cve_2020_17442
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	uint8_t len;

	stack_frame sf = {
		.r0 = len,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_17442(&sf);
		total += profile_end(EV0);
	}
	
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c35() {
	/*
	zephyros_cve_2020_13600
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	// char *test_str = "test\n";
	int i = 2;

	stack_frame sf = {
		.r0 = i,
	};

	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_13600(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
void test_c36() {
	/*
	zephyr_cve_2019_16748
	*/
	printf("Start the evaluation process!\n");
	
	uint64_t ret1 = 0;
	// char *test_str = "test\n";
	int ret = 1;
	int extIdx = 2;
	int certSz = 2;

	stack_frame sf = {
		.r0 = ret,
		.r1 = extIdx,
		.r3 = certSz,
	};


	uint32_t total = 0;
	profile_add_event("EV0");
	for (int i = 0; i < 1000; i++)
	{
		profile_start(EV0);
		ret1 = filter_16748(&sf);
		total += profile_end(EV0);
	}
	printf("Evaluation result for 1000 execution! total is : %d \n", total);

}
/////////////////////* End of NEW CVEs *////////////////////////////////


// AMNESIA33_cve_2020_17445
static char code12[] = ""
"\x61\x12\x00\x00\x00\x00\x00\x00\x61\x13\x08\x00\x00\x00\x00\x00\x07\x03\x00\x00\x02\x00\x00\x00\x71"
"\x21\x01\x00\x00\x00\x00\x00\x07\x02\x00\x00\x02\x00\x00\x00\x67\x01\x00\x00\x03\x00\x00\x00\x47\x01"
"\x00\x00\x06\x00\x00\x00\x18\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x18\x04\x00"
"\x00\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x71\x25\x01\x00\x00\x00\x00\x00\x07\x05\x00\x00"
"\x02\x00\x00\x00\xbf\x57\x00\x00\x00\x00\x00\x00\x57\x07\x00\x00\xff\x00\x00\x00\x15\x07\x11\x00\x00"
"\x00\x00\x00\xbf\x36\x00\x00\x00\x00\x00\x00\x0f\x76\x00\x00\x00\x00\x00\x00\xbf\x67\x00\x00\x00\x00"
"\x00\x00\x67\x07\x00\x00\x20\x00\x00\x00\x77\x07\x00\x00\x20\x00\x00\x00\x67\x03\x00\x00\x20\x00\x00"
"\x00\x77\x03\x00\x00\x20\x00\x00\x00\x3d\x73\x09\x00\x00\x00\x00\x00\x1f\x51\x00\x00\x00\x00\x00\x00"
"\x57\x05\x00\x00\xff\x00\x00\x00\x0f\x52\x00\x00\x00\x00\x00\x00\xb7\x04\x00\x00\x00\x00\x00\x00\xbf"
"\x15\x00\x00\x00\x00\x00\x00\x57\x05\x00\x00\xff\x00\x00\x00\xbf\x63\x00\x00\x00\x00\x00\x00\xb7\x00"
"\x00\x00\x00\x00\x00\x00\x55\x05\xe6\xff\x00\x00\x00\x00\x4f\x40\x00\x00\x00\x00\x00\x00\x95\x00\x00"
"\x00\x00\x00\x00\x00"
"";

void test_ebpf_c12() {
	// AMNESIA33_cve_2020_17445
	uint32_t opt_ptr = 0;
	uint8_t destopt[50] = {1, -2, -2, -2, -2, -2};
	stack_frame args_frame = {
		.r0 = destopt,
		.r1 = 0,
		.r2 = opt_ptr,
	};
	ebpf_eva(code12, sizeof(code12), &args_frame, sizeof(args_frame));
}



void ebpf_eva(uint8_t *code, int code_len, void *args, int ags_len) {
	bool test_jit = true;
	// test_jit = false;
	ebpf_vm vm;
	ebpf_vm_set_inst(&vm, code, code_len);
	//profile_exit();
	//profile_add_event("ebpf");
	//uint64_t ret1 = 0, ret2 = 0;
	//profile_start(EV0);
	//ret1 = ebpf_vm_exec(&vm, args, ags_len);
	//profile_end(EV0);
	// jit_compile
	if (test_jit) {
		gen_jit_code(&vm);
		//profile_start(EV1);
		//ret2 = vm.jit_func(args, ags_len);
		//profile_end(EV1);
		// printf("jit_func address: 0x%08x\n", (uint32_t) vm.jit_func);
		// jit_mem_free(vm.jmem);
	}
	
	//printf("Interupter: Op=%d Ret=%d Jit: Op=%d Ret=%d\n", (int) (ret1 >> 32), (int) (ret1 & 0xffffffff), 
	//	(int) (ret2 >> 32), (int) (ret2 & 0xffffffff));
	//profile_dump(EV0);
	//profile_dump(EV1);

	int total_mem = jit_mem_statistic(&vm) + get_ebpf_alloc_size();
	printf("mem size: %d bytes\n", total_mem);
	printf("finish----------------------------------------\n");
}


#pragma GCC pop_options

