#include <stdio.h>
#include <math.h>
#define PI	3.14159265358979323846

double find_pi(double zeta)
{
    double pi = sqrt(zeta * 6);
    return pi;
}

int main()
{
    double accuracy;
    printf("Введите точность (масимальная точность 0.000001): ");
    scanf("%lf", &accuracy);  
    
    double zeta = 0;
    for (long i = 1; i < 1000000; i++) {
        zeta += 1.0 / (i * i);
        if (fabs(PI - find_pi(zeta)) < accuracy) {
            break;
        }
    }
    
    printf("%lf\n", find_pi(zeta));

    return 0;
}
