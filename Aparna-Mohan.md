Name: Aparna Mohan, SID: 862396080, Net id: amoha121
1. How many total thread blocks do we use?
Matrix size of A = (1000)(1000)
Matrix size of B = (1000)(1000)
For the row matrix:
Thread_Block = ceil((dim-1)/block.x+1)
dim = 1000, block.x = 16
Thread_Block = Matrix size / Block_size
Thread_Block =  63 blocks for rows 
For the column matrix:
Thread_Block = ceil((dim-1)/block.y+1)
dim = 1000, block.y = 16
Thread_Block = Matrix size / Block_size
Thread_Block =  63 blocks for column
Total Thread_Block = (63)(63) = 3969  

3. Are all thread blocks full? That is, do all threads in the thread block 
have data to operate on?
No, all threads are not full.The last thread block may contain fewer 
active threads than the block size because there are remaining elements 
that cannot be evenly distributed among complete thread blocks.
For eg: 
If there are 1,000,000 elements in the matrices and a block size 
of 16, we will have 62,500 th read blocks (1,000,000 / 16). Each of the 
first 62,499 thread blocks will have 16 threads. However, the last thread 
block will only have two threads active (2 elements left), and the 
remaining 14 threads in that block will not have data to process.

3.How can this basic Matrix Addition program be improved? (What changes 
do you think can be made to speed up the code?)
Utilizing shared memory instead of global memory can enhance efficiency, 
and it's unnecessary to deallocate the GPU memory space upon execution 
completion. Using CUDA streams in the vector addition program allows for 
concurrent execution of memory transfers and computation.
