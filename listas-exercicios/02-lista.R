# Arquivo: 02-lista.R
# Autor(a): Maria Cecilia Pereira Mariano
# Data: 07/04/2026
# Objetivo:
# 1. Resolver os exercícios da lista 2


# Configurações globais ---------------------------------------------------

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# carrega os pacotes necessários


# Exercicio 1 -------------------------------------------------------------


## a) 

library(here) 
library(tidyverse)
library(janitor)

## b)


caminho_csv <- here("dados/brutos/dados_marketing.csv")
dados_marketing <- read_csv(caminho_csv)

## c)

glimpse(dados_marketing)

# Exercicio 2 -------------------------------------------------------------



## a) o que cada linha (observação) do arquivo representa?
# cada linha é uma semana de dados de marketing, e as colunas 
# descrevem os diferentes atributos dessa semana.


## b) quantas observações e quantas variáveis há no objeto dados_marketing?

 # Rows: 156 Columns: 9

# Exercicio 3 -------------------------------------------------------------

## a)

dados_marketing_limpos <- dados_marketing |> 
  clean_names()


dados_marketing_limpos

## b)
names(dados_marketing_limpos)


# Exercicio 4 -------------------------------------------------------------

dados_marketing_limpos |>
  select(data, mes, gasto_tv, gasto_radio, promocao, receita_vendas)

# Exercicio 5 -------------------------------------------------------------

dados_marketing_limpos <- dados_marketing_limpos |>
  mutate(
    gasto_total = gasto_tv + gasto_radio + gasto_redes_sociais + gasto_email
  )

dados_marketing_limpos |>
  select(data, mes, gasto_total, receita_vendas)

view(dados_marketing_limpos)


# Exercicio 6 -------------------------------------------------------------


dados_marketing_limpos <- dados_marketing_limpos |>
  mutate(
    status_promocao = ifelse(promocao == 1, "Com promoção", "Sem promoção"),
    status_concorrencia = ifelse(
      atividade_concorrente == 1, "Com concorrência", "Sem concorrência"
    )
  )

View(dados_marketing_limpos)

# Exercicio 7 -------------------------------------------------------------

caminho_rds <- here("dados/limpos/dados_marketing_limpos.rds")

readr::write_rds(dados_marketing_limpos, caminho_rds)


# Exercicio 8 -------------------------------------------------------------

dados_marketing_limpos |>
  filter(status_promocao == "Com promoção" & receita_vendas > 1000) |>
  select(data, mes, receita_vendas, status_promocao)


# Exercicio 9 -------------------------------------------------------------

resumo_mensal <- dados_marketing_limpos |>
  group_by(mes) |>
  summarise(
    receita_media = mean(receita_vendas),
    receita_total = sum(receita_vendas),
    gasto_total_medio = mean(gasto_total),
    semanas_com_promocao = sum(promocao == 1)
  ) |>
  arrange(desc(receita_media))

view(resumo_mensal)

# Meses com maiores receitas médias: 12, 11 e 10, respectavamente.