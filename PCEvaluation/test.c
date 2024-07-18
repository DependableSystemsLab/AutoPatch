#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h> // Include for gettimeofday() function

typedef struct stack_frame {
	uint32_t r0;
	uint32_t r1;
	uint32_t r2;
	uint32_t r3;
	uint32_t r12; // ip
	uint32_t lr;
	uint32_t pc; // return address
	uint32_t xpsr;
} __attribute__((__packed__)) stack_frame;

void test_c2(); 

int main() {
    printf("Hello, Welcome to AutoPatch!\n");
    
    test_c2(); //CVE-2020-10021
    
    return 0;
}


void test_c2() {
	/*
	zephyr_cve_2020_10021
	*/
	printf("Starting the process!\n");
	
	stack_frame sf;
	sf.r0 = 10; // n
	sf.r1 = 1024; // memory_size
	uint64_t ret1 = 0;
	uint32_t total = 0;
	
	clock_t start_time = clock();
	ret1 = filter_10021(&sf);
	clock_t end_time = clock();
	
	double elapsed_time = ((double)(end_time - start_time) / CLOCKS_PER_SEC);

	printf("Process is done!\n");
	printf("Hotpatch overhead: %f seconds and %f microseconds\n",elapsed_time, elapsed_time * 1000000);
}
