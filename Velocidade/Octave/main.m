% Invoca o FIS
a = newfis('Speed-Assessment', 'sugeno');

% Adiciona a variável de entrada para a velocidade do carro
a = addvar(a, 'input', 'Speed', [0 200]);

% Definir as funções de pertinência para a velocidade do carro
a = addmf(a, 'input', 1, 'Low-Speed', 'trapmf', [-10 0 40 60]);
a = addmf(a, 'input', 1, 'Moderate-Speed', 'trapmf', [40 60 80 100]);
a = addmf(a, 'input', 1, 'High-Speed', 'trapmf', [80 100 200 210]);

% Adicionar a variável de entrada para a aceleração do carro
a = addvar(a, 'input', 'Acceleration', [0 10]);
a = addmf(a, 'input', 2, 'Low-Acceleration', 'trapmf', [-1 0 2 4]);
a = addmf(a, 'input', 2, 'Moderate-Acceleration', 'trapmf', [2 4 6 8]);
a = addmf(a, 'input', 2, 'High-Acceleration', 'trapmf', [6 8 10 11]);

% Visualizar as funções de pertinência
plotmf(a, 'input', 1); % Para a velocidade
plotmf(a, 'input', 2); % Para a aceleração

