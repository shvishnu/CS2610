Analysis of asm files for recursive and iterative finding of fibonacci number

1 suffix is for iterative and 2 suffix is for recursive

The compile1.sh contains the compilation codes for iterative algorithm
compile2.sh contains the compilation codes for recursive algorithm

build1.sh runs the binary file for iterative fibonacci for the first 41 whole numbers i.e. i = {0..40}
build2.sh runs the binary file for recursive fibonacci for the first 41 whole numbers i.e. i = {0..40}

We can clearly see the difference between the 2 while execution itself.
./build1.sh takes significantly lesser time than ./build2.sh

(Analysis is done only till n = 40 as 32 bit supports only fibonacci number upto that)

Reason:
	This is because the iterative algorithm runs in linear time while the recursive algorithm takes exponential time.
	The recursive version has a lot of recalculations of the same values and hence is slower than the iterative version.

RDTSC:
	the rdtsc is a 64 bit value.
	The most signifact 32 bits are in edx and least significant 32 bits are in eax.
	So we print the starting and ending values of each edx and eax for each value in {0..40}.
	This info is in f1.txt for iteration and f2.txt for recursion.
	a$i.py takes these values and prints the values of clock cycles taken for each value in {0..40}.
	The clockcycle times for iterative version is stored in time1.txt and recursive in time2.txt
	It is clearly visible that iterative version is much faster.
	
All the commands used are given below:
	./compile1.sh
	./compile2.sh
	touch f1.txt
	touch f2.txt
	./build1.txt
	./build2.txt
	python a1.txt > time1.txt
	python a2.txt > time2.txt
