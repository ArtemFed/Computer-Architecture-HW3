#include <math.h>
#include <stdio.h>

#define min_size 3
#define max_size 8

double func(double x) {
    return pow(x, 4) - pow(x, 3) - 2.5;
}

// Метод хорд
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

int check_accuracy(int degree) {
    fflush(stdin);
    if (degree < min_size) {
        printf("\nIncorrect value: %d. Expected value from %d to %d. It will be replaced by %d\n", degree, min_size, max_size, min_size);
        return min_size;
    } else if (degree > max_size) {
        printf("\nIncorrect value: %d. Expected value from %d to %d. It will be replaced by %d\n", degree, min_size, max_size, max_size);
        return max_size;
    }
    return degree;
}