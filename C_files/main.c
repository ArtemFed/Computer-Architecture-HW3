#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define a 1
#define b 2
#define min_size 0.00000001
#define max_size 0.001

extern double task(double left, double right, double epsilon);
extern double check_accuracy(double epsilon);

int main(int argc, char *argv[]) {
    // cmd arg + Timer
    double epsilon = 0;
    if (argc == 2) {
        sscanf(argv[1], "%lf", &epsilon);
        epsilon = check_accuracy(epsilon);
        printf("Epsilon: %*.*lf", 1, 8, epsilon);

        time_t t_start = clock();
        for (int i = 0; i < 25000000; ++i) {
            task(a, b, epsilon);
        }
        time_t t_end = clock();

        printf("\nTime: %d ms", (int) (difftime(t_end, t_start)) / 1000);
        printf("\nResult: x =  %*.*lf\n", 1, ((int) strlen(argv[1])) - 2 , task(a, b, epsilon));
        return 0;
    }
    // Get str from File + cmd args
    if (argc == 3) {
        FILE *input_stream = fopen(argv[1], "r");
        if (input_stream == NULL) {
            printf("Error opening file!\n");
            return 0;
        }
        fscanf(input_stream, "%lf", &epsilon);
        fclose(input_stream);

        epsilon = check_accuracy(epsilon);

        FILE *output_stream = fopen(argv[2], "w");
        fprintf(output_stream, "%*.*lf\n", 1, 8, task(a, b, epsilon));
        fclose(output_stream);
        return 0;
    }
    printf("Random input or Direct (ans: 1, !=1):");
    int answer = 0;
    scanf("%d", &answer);
    // Random
    if (answer == 1) {
        srand(clock());
        epsilon = (double) (rand()) / RAND_MAX * (0.001 - 0.00000001) + 0.00000001;
    } else {
        // CMD input
        printf("Input epsilon: (%*.*lf <= value <= %*.*lf):", 1, 8, min_size, 1, 3, max_size);
        scanf("%lf", &epsilon);
    }
    epsilon = check_accuracy(epsilon);
    double result = task(a, b, epsilon);
    printf("Epsilon: %*.*lf\nResult: x = %*.*lf\n", 1, 8, epsilon, 1, 8, result);
    if (answer == 1) {
        FILE *rand_out_stream = fopen("random_out.txt", "w");
        fprintf(rand_out_stream, "%lf\n", result);
        fclose(rand_out_stream);
        printf("Also the result was added to \"random_out.txt\".");
    }
    return 0;
}
