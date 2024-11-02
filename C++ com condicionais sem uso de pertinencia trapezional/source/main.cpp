#include <iostream>
#include <algorithm>
#include "Speed.h"

using namespace std;

int main() {
    Speed spd;

    double speed, acceleration;
    cout << "Digite a velocidade do carro (0 a 200 km/h): ";
    cin >> speed;
    cout << "Digite a aceleracao do carro (0 a 10 m/s^2): ";
    cin >> acceleration;

    spd.classifySpeed(speed);
    spd.classifyAcceleration(acceleration);

    system("pause");

    return 0;
}