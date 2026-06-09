# Arquivo: 02-avaliacao-resolucao.R
# Integrante 1: Lorena Vilela
# Integrante 2: Maria Cecília Mariano
# Integrante 3: nome
# Integrante 4: nome
# Data: 09/06/2026
# Objetivo: Resolução da Avaliação 2 — Introdução à Ciência de Dados


# Configurações globais ---------------------------------------
options(digits = 5, scipen = 999)

# Exercício 1 -------------------------------------------------

# a) 

# S = {Renova, Não_Renova}

# Renova = cliente renovou o contrato nos 30 dias seguintes.
# Não_Renova = cliente não renovou o contrato nos 30 dias seguintes.


# b) 

# A={Renova}
# Em palavras: o cliente renovou o contrato.

# c) 

# P(A)
# ou
# P(cliente renova o contrato)

# d) 

# Antes de definir uma variável aleatória, o resultado observado
# não é diretamente numérico. O resultado é categórico (Renova ou
# Não_Renova). A variável aleatória associa números a esses resultados.
# Ele só passa a ser representado numericamente depois que definimos X.

# e) 

## Variável aleatória indicadora:
# X = 1, se o cliente renovou o contrato em 30 dias seguintes.
# X = 0, se o cliente não renovou o contrato em 30 dias seguintes.

# f) 
# Bernoulli, pois a variável possui apenas dois resultados possíveis :
# (1 = renovou e 0 = não renovou).


# Exercício 2 -------------------------------------------------

# a) 

# X = 12, quando o cupom é utilizado.
# X = 0, quando o cupom não é utilizado.

# b) P(X = 12) = 0,10
#

# c) P(X = 0) = 0,90
#

# d)

# E(X) = X1 * P(X = 12) + X2 * P(X = 0)
# E(X) = 12 × 0,10 + 0 × 0,90
# E(X) = 1,2
#

# e)

# O custo médio esperado do cupom é de R$ 1,20 por cliente.
# Isso não significa que cada cliente gerará esse custo; 
# individualmente o custo será R$ 0,00 ou R$ 12,00.



# Exercício 3 -------------------------------------------------

# Digite e execute o código necessário e escreva a 
# interpretação em comentários.


#A) 

set.seed(123)

lambda <- 10
capacidade <- 13
n_simulacoes <- 1000

#b) 

clientes <- rpois(
  n = n_simulacoes, 
  lambda = lambda
  )


#c)

media_simulada <- mean(clientes)
media_simulada

View(media_simulada)

#d)

prop_acima_capacidade <- mean(clientes > capacidade)
prop_acima_capacidade

View(prop_acima_capacidade)

#e)

percentil_95 <- quantile(clientes, 0.95)
percentil_95

#f)

# Interpretação

# A média simulada ficou próxima de 10 clientes por hora, coerente com o 
# modelo Poisson(λ=10).

# Aproximadamente 13% das simulações ultrapassaram a capacidade atual de 13 
# clientes.

# O percentil 95 foi aproximadamente 16 clientes, indicando que cerca de 95%
# das horas de pico apresentam até 16 clientes.

# Como o percentil 95 está acima da capacidade atual, há situações relevantes 
# em que a unidade pode ficar sobrecarregada.

# Portanto, a capacidade de 13 clientes por hora parece um pouco limitada, 
# embora seja suficiente para a maior parte das situações de pico.