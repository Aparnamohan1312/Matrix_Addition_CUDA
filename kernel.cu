#include <stdio.h>

#define TILE_SIZE 16

__global__ void matAdd(int dim, const float *A, const float *B, float* C) {

    /********************************************************************
     *
     * Compute C = A + B
     *   where A is a (dim x dim) matrix
     *   where B is a (dim x dim) matrix
     *   where C is a (dim x dim) matrix
     *
     ********************************************************************/
int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (col < dim && row < dim) {
        int index = row * dim + col;
        C[index] = A[index] + B[index];
    } }  


 //int c = threadIdx.x + blockDim.x * blockIdx.x;
    //if (c<dim*dim) C[c] = A[c] + B[c];}
void basicMatAdd(int dim, const float *A, const float *B, float *C)
{
    // Initialize thread block and kernel grid dimensions ---------------------
// Launch the kernel
   
const unsigned int BLOCK_SIZE = TILE_SIZE;
dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);
    dim3 dimGrid((dim + dimBlock.x - 1) / dimBlock.x, (dim + dimBlock.y - 1) / dimBlock.y);

    matAdd<<<dimGrid, dimBlock>>>(dim, A, B, C);
// Invoke CUDA kernel -----------------------------------------------------

    /*************************************************************************/
    //INSERT CODE HERE
	
    /*************************************************************************/
    cudaDeviceSynchronize();
}
