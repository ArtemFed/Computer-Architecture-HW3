#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define a 1
#define b 2
#define min_size 3
#define max_size 8

extern double task(double left, double right, double epsilon);
extern int check_accuracy(int degree);

int main(int argc, char *argv[]) {
    // cmd arg + Timer
    int degree = 0;
    double accuracy = 0;

    if (argc == 2) {
        if (strlen(argv[1]) == 1 && argv[1][0] >= min_size + '0' && argv[1][0] <= max_size + '0') {
            degree = atoi(argv[1]);
        } else {
            printf("Incorrect argument: \"%s\". Expected value from %d to %d\n", argv[1], min_size, max_size);
            return 0;
        }
        printf("Accuracy: %d", degree);
        accuracy = pow(10, -1 * degree);

        time_t t_start = clock();

        for (int i = 0; i < 10000000; ++i) {
            task(a, b, accuracy);
        }
        time_t t_end = clock();

        printf("\nTime: %d ms", (int) (difftime(t_end, t_start)) / 1000);
        printf("\nResult: x =  %*.*lf\n", 1, degree, task(a, b, accuracy));
        return 0;
    }
    // Get str from File + cmd args
    if (argc == 3) {
        FILE *input_stream = fopen(argv[1], "r");
        if (input_stream == NULL) {
            printf("Error opening file!\n\n");
            return 0;
        }
        fscanf(input_stream, "%d", &degree);
        fclose(input_stream);

        degree = check_accuracy(degree);

        FILE *output_stream = fopen(argv[2], "w");
        fprintf(output_stream, "%*.*lf\n", 1, degree, task(a, b, pow(10, -1 * degree)));
        fclose(output_stream);
        return 0;
    }
    printf("Random input or Direct (ans: 1, !=1):");
    int answer = 0;
    scanf("%d", &answer);
    if (answer == 1) {
        srand(clock());
        degree = min_size + rand() % 6;
    } else {
        printf("Input value: 10^-(value) (%d <= value <= %d):", min_size, max_size);
        scanf("%d", &degree);
        degree = check_accuracy(degree);
    }
    accuracy = pow(10, -1 * degree);
    printf("Accuracy: %*.*lf\nResult: x = %*.*lf\n", 1, degree, accuracy, 1, degree, task(a, b, accuracy));
    return 0;
}
