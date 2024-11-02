import numpy as np

class RedeNeural:
    def __init__(self):
        self.pesos_input_hidden = np.random.uniform(-1, 1, (2, 2))  
        self.pesos_hidden_output = np.random.uniform(-1, 1, (2, 1)) 

    def sigmoide(self, x):
        return 1 / (1 + np.exp(-x))

    def derivada_sigmoide(self, x):
        return x * (1 - x)

    def treinar(self, X, y, iteracoes=50000, taxa_aprendizado=0.1):
        for i in range(iteracoes):
            camada_oculta = self.sigmoide(X.dot(self.pesos_input_hidden))
            saidas = self.sigmoide(camada_oculta.dot(self.pesos_hidden_output))

            erro = y - saidas

            delta_saida = erro * self.derivada_sigmoide(saidas)
            erro_oculta = delta_saida.dot(self.pesos_hidden_output.T)
            delta_oculta = erro_oculta * self.derivada_sigmoide(camada_oculta)

            self.pesos_hidden_output += camada_oculta.T.dot(delta_saida) * taxa_aprendizado
            self.pesos_input_hidden += X.T.dot(delta_oculta) * taxa_aprendizado

            if i % 10000 == 0:
                print(f"Erro na iteração {i}: {np.mean(np.abs(erro))}")

    def prever(self, X):
        camada_oculta = self.sigmoide(X.dot(self.pesos_input_hidden))
        return self.sigmoide(camada_oculta.dot(self.pesos_hidden_output))

X = np.array([[0, 0],
              [0, 1],
              [1, 0],
              [1, 1]])

y = np.array([[0],
              [1],
              [1],
              [0]])

rede = RedeNeural()

rede.treinar(X, y)

saidas = rede.prever(X)

print("Saída após o treinamento:")
print(saidas)