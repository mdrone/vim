:insert
/*
 * File Name     :
 * Purpose       :
 * Creation Date :
 * Last Modified : Tue 01 Nov 2016 05:24:13 PM CET
 * Created By    :
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <signal.h>
#include <fcntl.h>
#include <sys/file.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <cuda.h>

// hello from GPU kernel
__global__ void helloFromGPU(void)
{
    printf("Hello World from GPU! \n");
}

int main (int argc, char *argv[])
{
    printf("Step one\n");
    printf("???\n");
    printf("Profit\n");

    helloFromGPU <<<1, 10>>>();
   
    // release the device
    cudaDeviceReset();
    return 0;
}
