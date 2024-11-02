#include "Speed.h"

#include <iostream>

using namespace std;

void Speed::classifySpeed(double speed) {
    if (speed <= 60) {
        cout << "Baixa Velocidade\n";
    }
    else if (speed <= 100) {
        cout << "Velocidade Moderada\n";
    }
    else {
        cout << "Alta Velocidade\n";
    }
}

void Speed::classifyAcceleration(double acceleration) {
    if (acceleration <= 4) {
        cout << "Baixa Aceleracao\n";
    }
    else if (acceleration <= 8) {
        cout << "Aceleracao Moderada\n";
    }
    else {
        cout << "Alta Aceleracao\n";
    }
}
