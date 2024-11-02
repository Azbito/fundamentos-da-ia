#include "Speed.h"

// Fun��o de pertin�ncia trapezoidal para velocidade
double Speed::trapmf(double x, double a, double b, double c, double d) {
    if (x <= a || x >= d)
        return 0.0;
    else if (x >= b && x <= c)
        return 1.0;
    else if (x > a && x < b)
        return (x - a) / (b - a);
    else
        return (d - x) / (d - c);
}

// Fun��es de pertin�ncia para diferentes faixas de velocidade
double Speed::lowSpeed(double speed) {
    return trapmf(speed, -10, 0, 40, 60);
}

double Speed::moderateSpeed(double speed) {
    return trapmf(speed, 40, 60, 80, 100);
}

double Speed::highSpeed(double speed) {
    return trapmf(speed, 80, 100, 200, 210);
}

// Fun��es de pertin�ncia para diferentes faixas de acelera��o
double Speed::lowAcceleration(double acceleration) {
    return trapmf(acceleration, -1, 0, 2, 4);
}

double Speed::moderateAcceleration(double acceleration) {
    return trapmf(acceleration, 2, 4, 6, 8);
}

double Speed::highAcceleration(double acceleration) {
    return trapmf(acceleration, 6, 8, 10, 11);
}