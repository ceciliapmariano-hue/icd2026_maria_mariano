# Arquivo: revisao-probabilidade.R
# Autor: SEU NOME
# Data: 08/06/2026
# Objetivos:
# Exercícios de revisão para a avaliação 2

# Configurações globais -------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)

# Orientação:
# Nos Exercícios 1, 2 e 3, escreva as respostas como comentários.
# No Exercício 4, complete e execute o código em R.


# Exercício 1 -----------------------------------------------------
# Experimento, evento e variável aleatória

# a) 


# S = {Compra, Não_Compra}
# onde:
# Compra = cliente realizou uma compra nos 7 dias seguintes ao e-mail
# Não_Compra = cliente não realizou uma compra nos 7 dias seguintes ao e-mail

# b) 

# Evento associado à realização de compra:
# A = {Compra}
# Em palavras: A é o evento "o cliente realiza compra".

# c) 

# Probabilidade do evento:

# P(A)
# ou
# P(cliente realiza compra).


# d) 

# Antes de definir uma variável aleatória, o resultado observado
# não é diretamente numérico. O resultado é categórico (Compra ou
# Não_Compra). A variável aleatória associa números a esses resultados.
# Ele só passa a ser representado numericamente depois que definimos X.

# e) 

# Variável aleatória indicadora:
# X = 1, se o cliente realizou uma compra nos 7 dias seguintes
# X = 0, se o cliente não realizou uma compra nos 7 dias seguintes

# Com essa definição, o evento A = {compra} também pode ser escrito
# como X = 1. Assim, P(A) = P(X = 1).

# Exercício 2 -----------------------------------------------------
# Valor esperado em uma decisão simples

# a) Valores possíveis de X:

# X = 500, quando a garantia é acionada;
# X = 0, quando a garantia não é acionada.

# b) P(X = 500) = 0,04


# c) P(X = 0) = 0,96
 

# d) E(X) = ___
# E(X) = X1 * P(X = 500) + X2 * P(X = 0)
# E(X) = 500 × 0,04 + 0 × 0,96
# E(X) = 20

# e) Interpretação do valor esperado:

# O custo esperado da garantia é R$ 20 por produto vendido.
# Isso não significa que cada produto terá custo de R$ 20.
# Individualmente, o custo será R$ 0 ou R$ 500.
# O valor esperado resume o custo médio por produto quando pensamos
# em muitos produtos vendidos sob as mesmas condições.

# Exercício 3 -----------------------------------------------------
# Escolha de distribuição de probabilidade

# a) 
# Modelo: Bernoulli.
# Justificativa: a variável observada possui apenas dois resultados
# possíveis, compra ou não compra.

# b) 
# Modelo: Binomial.
# Justificativa:conta o número de sucessos em um número fixo de tentativas
# semelhantes, neste caso 300 clientes contatados.

# c) 
# Modelo: Poisson.
# Justificativa:conta ocorrências em um intervalo fixo de tempo,
# neste caso o número de chegadas em uma hora de pico.

# d) 
# Modelo: Normal.
# Justificativa: variável numérica contínua, com valores aproximadamente
# simétricos em torno de uma média.

# Exercício 4 -----------------------------------------------------
# Simulação com distribuição de Poisson
# escreva, complete e execute o código fornecido

# fixa a semente para que a simulação possa ser reproduzida
set.seed(123)

# parâmetros da simulação
lambda <- 12
capacidade <- 15

# quantidade de valores de X que serão simulados
n_simulacoes <- 1000

# simula 1.000 valores de X
clientes <- rpois(n = n_simulacoes, lambda = lambda)
head(clientes)

# média simulada
media_simulada <- mean(clientes)
media_simulada

# proporção de simulações acima da capacidade
prop_acima_capacidade <- mean(clientes > capacidade)
prop_acima_capacidade

# percentil 95
percentil_95 <- quantile(clientes, 0.95)
percentil_95

# e) Interpretação da capacidade atual

# Interpretação:

# A média simulada ficou próxima de 12 clientes por hora, como esperado
# pelo modelo Poisson(lambda = 12).
#
# A capacidade de 15 clientes foi excedida em cerca de 14,4% dos valores
# simulados. Portanto, em uma hora de pico sob esse modelo, a unidade ficaria
# acima da capacidade com alguma frequência.
#
# O percentil 95 foi igual a 18. Nesta simulação, isso indica que uma
# capacidade de 18 clientes por hora cobriria cerca de 95% das simulações.
#
# Assim, se a prioridade for reduzir saturação no horário de pico,
# a capacidade atual de 15 clientes por hora parece limitada. Se a unidade
# aceitar alguma espera em parte das horas de pico, essa capacidade ainda
# pode ser defendida, mas com risco operacional visível.