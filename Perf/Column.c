#include <stdio.h>
#include <sys/time.h>
#include <stdlib.h>

const int n = 1024;

void main() {
    struct timeval begin, end;
    int **A = (int**)malloc(n*(sizeof(int*)));
    int **B = (int**)malloc(n*(sizeof(int*)));
    int **C = (int**)malloc(n*(sizeof(int*)));

    for(int i = 0; i < n; i++) {
        A[i] = (int*)malloc(n*(sizeof(int)));
        B[i] = (int*)malloc(n*(sizeof(int)));
        C[i] = (int*)malloc(n*(sizeof(int)));
        for(int j = 0; j < n; j++) {
            A[i][j] = rand()%11;
            B[i][j] = rand()%11;
        }
    }
    gettimeofday(&begin, NULL);
    for(int i  = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            C[i][j] = 0;
            for(int k = 0; k < n; k++) {
                C[i][j] += A[i][k]*B[j][k];
            }
        }
    }
    gettimeofday(&end, NULL);
    long long int runTime = (end.tv_sec - begin.tv_sec)*1000000;
    runTime += end.tv_usec-begin.tv_usec;
    printf("%lld", runTime);
}
