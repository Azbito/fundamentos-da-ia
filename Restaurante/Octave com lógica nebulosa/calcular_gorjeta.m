function main
    try
        qualidade_comida = input('Digite a qualidade da comida (0 a 10): ');
        qualidade_servico = input('Digite a qualidade do serviço (0 a 10): ');

        if qualidade_comida < 0 || qualidade_comida > 10 || qualidade_servico < 0 || qualidade_servico > 10
            error('Os valores de qualidade da comida e do serviço devem estar entre 0 e 10.');
        end

        comida_vals = 0:10;
        servico_vals = 0:10;
        gorjeta_vals = zeros(length(comida_vals), length(servico_vals));

        for i = 1:length(comida_vals)
            for j = 1:length(servico_vals)
                gorjeta_vals(i, j) = calcular_gorjeta_nebulosa(comida_vals(i), servico_vals(j));
            end
        end

        figure;
        surf(servico_vals, comida_vals, gorjeta_vals);
        xlabel('Qualidade do Serviço');
        ylabel('Qualidade da Comida');
        zlabel('Gorjeta Sugerida (%)');
        title('Gorjeta Sugerida pela Lógica Nebulosa');
        hold on;

        gorjeta_usuario = calcular_gorjeta_nebulosa(qualidade_comida, qualidade_servico);
        plot3(qualidade_servico, qualidade_comida, gorjeta_usuario, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
        legend('Superfície', 'Valor do Usuário');

        valor_gorjeta = calcular_gorjeta(qualidade_comida, qualidade_servico);
        if valor_gorjeta == -1
            fprintf('Erro ao calcular a gorjeta sem Lógica Nebulosa.\n');
        else
            fprintf('A gorjeta sugerida é de %d%%.\n', valor_gorjeta);
        end

        valor_gorjeta_nebulosa = calcular_gorjeta_nebulosa(qualidade_comida, qualidade_servico);
        if valor_gorjeta_nebulosa == -1
            fprintf('Erro ao calcular a gorjeta com Lógica Nebulosa.\n');
        else
            fprintf('A gorjeta sugerida com Lógica Nebulosa é de %d%%.\n', valor_gorjeta_nebulosa);
        end

    catch err
        fprintf('Erro ao executar o script: %s\n', err.message);
    end
end


function gorjeta = calcular_gorjeta(comida, servico)
    try
        if nargin < 2
            error('Faltam argumentos: comida e servico devem ser fornecidos.');
        elseif comida < 0 || comida > 10 || servico < 0 || servico > 10
            error('Os valores de comida e servico devem estar entre 0 e 10.');
        end

        if comida < 4 || servico < 4
            gorjeta = 5;
        elseif comida >= 7 || servico >= 7
            gorjeta = 15;
        else
            gorjeta = 10;
        end
    catch err
        fprintf('Erro na função calcular_gorjeta: %s\n', err.message);
        gorjeta = -1;
    end
end

function mu = pertinencia_comida(comida)
    try
        if comida < 0 || comida > 10
            error('O valor de comida deve estar entre 0 e 10.');
        end

        if comida < 3
            mu = 0;
        elseif comida < 5
            mu = (comida - 3) / (5 - 3);
        elseif comida < 8
            mu = 1;
        elseif comida < 10
            mu = (10 - comida) / (10 - 8);
        else
            mu = 1;
        end
    catch err
        fprintf('Erro na função pertinencia_comida: %s\n', err.message);
        mu = -1;
    end
end

function mu = pertinencia_servico(servico)
    try
        if servico < 0 || servico > 10
            error('O valor de servico deve estar entre 0 e 10.');
        end

        if servico < 3
            mu = 0;
        elseif servico < 5
            mu = (servico - 3) / (5 - 3);
        elseif servico < 8
            mu = 1;
        elseif servico < 10
            mu = (10 - servico) / (10 - 8);
        else
            mu = 1;
        end
    catch err
        fprintf('Erro na função pertinencia_servico: %s\n', err.message);
        mu = -1;
    end
end

function gorjeta = calcular_gorjeta_nebulosa(comida, servico)
    try
        mu_comida_ruim = pertinencia_comida(comida);
        fprintf('Pertinência comida ruim: %.2f\n', mu_comida_ruim);
        mu_servico_ruim = pertinencia_servico(servico);
        fprintf('Pertinência serviço ruim: %.2f\n', mu_servico_ruim);

        mu_comida_bom = pertinencia_comida(comida);
        fprintf('Pertinência comida boa: %.2f\n', mu_comida_bom);

        mu_servico_bom = pertinencia_servico(servico);
        fprintf('Pertinência serviço bom: %.2f\n', mu_servico_bom);

        mu_comida_muito_bom = pertinencia_comida(comida);
        fprintf('Pertinência comida muito boa: %.2f\n', mu_comida_muito_bom);

        mu_servico_muito_bom = pertinencia_servico(servico);
        fprintf('Pertinência serviço muito bom: %.2f\n', mu_servico_muito_bom);

        mu_gorjeta_5 = min(mu_comida_ruim, mu_servico_ruim);
        fprintf('Gorjeta 5%%: %.2f\n', mu_gorjeta_5);

        mu_gorjeta_10_candidates = [min(mu_comida_bom, mu_servico_bom), ...
                                    min(mu_comida_bom, mu_servico_muito_bom), ...
                                    min(mu_comida_muito_bom, mu_servico_bom)];

        mu_gorjeta_10 = max(mu_gorjeta_10_candidates);
        fprintf('Gorjeta 10%%: %.2f\n', mu_gorjeta_10);

        mu_gorjeta_15 = min(mu_comida_muito_bom, mu_servico_muito_bom);
        fprintf('Gorjeta 15%%: %.2f\n', mu_gorjeta_15);

        numerador = (mu_gorjeta_5 * 5) + (mu_gorjeta_10 * 10) + (mu_gorjeta_15 * 15);
        fprintf('Numerador: %.2f\n', numerador);

        denominador = mu_gorjeta_5 + mu_gorjeta_10 + mu_gorjeta_15;
        fprintf('Denominador: %.2f\n', denominador);

        if denominador > 0
            gorjeta = floor(numerador / denominador);
            gorjeta = max(0, gorjeta);
        else
            gorjeta = 0;
        end
    catch err
        fprintf('Erro na função calcular_gorjeta_nebulosa: %s\n', err.message);
        gorjeta = -1;
    end
end

main;