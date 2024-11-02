comida = input("Qualidade da comida (0 a 10): ");
servico = input("Qualidade do serviço (0 a 10): ");

if comida <= 3 || servico <= 3
    gorjeta = 5; % 5% para qualidade ruim de comida ou serviço
elseif comida >= 8 || servico >= 8
    gorjeta = 15; % 15% para qualidade excelente de comida ou serviço
else
    gorjeta = 10; % 10% para qualidade média
end

fprintf("A gorjeta sugerida é: %.2f%%\n", gorjeta);