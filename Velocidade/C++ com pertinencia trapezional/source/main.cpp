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

    double lowSpeedVal = spd.lowSpeed(speed);
    double moderateSpeedVal = spd.moderateSpeed(speed);
    double highSpeedVal = spd.highSpeed(speed);

    double lowAccVal = spd.lowAcceleration(acceleration);
    double moderateAccVal = spd.moderateAcceleration(acceleration);
    double highAccVal = spd.highAcceleration(acceleration);

    cout << u8"Pertinencia para Velocidade:\n";
    cout << "Baixa: " << lowSpeedVal << "\n";
    cout << "Moderada: " << moderateSpeedVal << "\n";
    cout << "Alta: " << highSpeedVal << "\n";

    cout << u8"\nPertinencia para Aceleracao:\n";
    cout << "Baixa: " << lowAccVal << "\n";
    cout << "Moderada: " << moderateAccVal << "\n";
    cout << "Alta: " << highAccVal << "\n";

    system("pause");

    return 0;
}
