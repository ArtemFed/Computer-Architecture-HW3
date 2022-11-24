#include <math.h>
#include <stdio.h>

#define min_size 0.00000001
#define max_size 0.001

double func(double x) {
    return pow(x, 4) - pow(x, 3) - 2.5;
}

// Chord Method
double task(double left, double right, double epsilon) {
    double x1 = left, x2 = right, fb = func(right), mid = 0;
    while (fabs(func(x2)) > epsilon)
    {
        mid = x2 - (x2 - x1) * fb / (fb - func(x1));
        x1 = x2;
        x2 = mid;
        fb = func(x2);
    }
    return x2;
}

double check_accuracy(double epsilon) {
    fflush(stdin);
    if (epsilon < min_size) {
        printf("Incorrect Epsilon: %lf. Expected value from %lf to %lf. It will be replaced by %*.*lf\n", epsilon, min_size, max_size, 1, 8, min_size);
        return min_size;
    } else if (epsilon > max_size) {
        printf("Incorrect Epsilon: %lf. Expected value from %lf to %lf. It will be replaced by %*.*lf\n", epsilon, min_size, max_size, 1, 3, max_size);
        return max_size;
    }
    return epsilon;
}