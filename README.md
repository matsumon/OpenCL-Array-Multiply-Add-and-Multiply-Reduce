# OpenCL-Array-Multiply-Multiply-Add-and-Multiply-Reduce
Introduction

There are many problems in scientific computing where you want to do arithmetic on multiple arrays of numbers (matrix manipulation, Fourier transformation, convolution, etc.). This project is in three parts:

    Multiply two arrays together using OpenCL:
    D[gid] = A[gid] * B[gid];
    Benchmark it against both input array size (i.e., the global work size) and the local work size (i.e., number of work-items per work-group).
    Multiply two arrays together and add a third using OpenCL:
    D[gid] = ( A[gid] * B[gid] ) + C[gid];
    Benchmark it against both input array size (i.e., the global work size) and the local work size (i.e., number of work-items per work-group).
    Perform the same array multiply as in #1, but this time with a reduction:
    Sum = summation{ A[:]*B[:] };
    Benchmark that against input array size (i.e., the global work size). You can pick a local work size and hold that constant. 

Some Help

Here is a Visual Studio solution for this,

I have updated the PrintInfo code into a function. You can get it here. It contains a function called PrintOpenclInfo( ). It also contains a function called SelectOpenclDevice( ) which selects what it thinks is the best system to run your OpenCL code on. Feel free to copy and paste these into your code.
Requirements:

    First, work on the Array Multiply and the Array Multiply-Add portions:

    Start with the first.cpp and first.cl files. That code already does array multiplication for one particular combination of global work size and local work size.

    Helpful Hint: The Array Multiply and the Array Multiply-Add can really be the same program. Write one single program that creates the 4 arrays. Pass A, B, and C into OpenCL, and return D. Then all you have to do between the Multiply and Multiply-Add tests is change one line in the .cl file.

    Make this all work for global work sizes in (at least) the range 1K to 8M, and local work sizes in (at least) the range 8 to 512, or up to the maximum work-group size allowed by your system. How you do this is up to you. Use enough values in those ranges to make good graphs.

    Use performance units that make sense. Joe Parallel used "MegaMultiplies Per Second" and "MegaMultiply-Adds Per Second".

    Make two graphs:
        Multiply and Multiply-Add performance versus Global Dataset Size, with a series of colored Constant-Local-Work-Size curves
        Multiply and Multiply-Add performance versus Local Work Size, with a series of colored Constant-Global-Dataset-Size curves 

    Your commentary PDF should tell:
        What machine you ran this on
        Show the tables and graphs
        What patterns are you seeing in the performance curves?
        Why do you think the patterns look this way?
        What is the performance difference between doing a Multiply and doing a Multiply-Add?
        What does that mean for the proper use of GPU parallel computing? 

    Then, write another version of the code that turns it into a Multiply+Reduce application.

    Note that this will ultimately compute just a single floating point scalar value.

    Produce the product array on the GPU, and then do the reduction on it from the same kernel.

    Return an array, the same size as the number of work-groups. Each element of the array will have the sum from all the items in one work-group. Add up the elements of the array yourself.

    Try at last 3 different local work sizes, more if you want. Make it no smaller than 32. Make it no larger than 256.

    Vary the size of the input array from 1K to 8M.

    Plot another graph showing Multiply-reduction performance versus Input Array Size.

    Use performance units that make sense. Jane Parallel used "MegaMultiply-Reductions Per Second".

    To your PDF write-up add:

        Show this table and graph
        What pattern are you seeing in this performance curve?
        Why do you think the pattern looks this way?
        What does that mean for the proper use of GPU parallel computing? 
