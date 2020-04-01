# Pacotes ------------------------------------------------------------------

library(tidymodels)
library(parsnip)
library(ISLR)

# Me ----------------------------------------------------------------------

Auto

help(Auto)

# Conceito

# Precisamos passar pro R:
# 1. A f que queremos usar
# 2. Aplicar a f para um conjunto de dados

# Passo 1: Especificações de f:

especificacao_lm <- linear_reg() %>%
  set_engine("lm") %>% 
  set_mode("regression")

# Us ----------------------------------------------------------------------

# Passo 2: Ajuste do modelo

modelo_linear <- especificacao_lm %>% 
  fit(mpg~horsepower, data = Auto)

print(modelo_linear)
summary(modelo_linear$fit)

# Passo 3: Analisar as previsões

valores_ajustados <- predict(modelo_linear, new_data = Auto)

# podemos usar a função predict para aplicar o modelo em qualquer novo conjunto de dados (new_data)

Auto_com_previsao <- Auto %>% 
  mutate(
    mpg_e = valores_ajustados[[1]]
  )

Auto_para_plot <- Auto_com_previsao %>%
  select(mpg, mpg_e, horsepower) %>% 
  gather(tipo, y, -horsepower)

ggplot() +
  geom_point(aes(horsepower, y), data = filter(Auto_para_plot, tipo != "mpg_e")) +
  geom_line(aes(horsepower, y), data = filter(Auto_para_plot, tipo == "mpg_e"), color = 'red') +
  theme_bw()

library(yardstick)

# Métricas de erro
rmse(Auto_com_previsao, truth = mpg, estimate = mpg_e)
mae(Auto_com_previsao, truth = mpg, estimate = mpg_e)
mape(Auto_com_previsao, truth = mpg, estimate = mpg_e)

# You ---------------------------------------------------------------------

# Exercícios

# 1. Ajuse um modelo para a variável resposta mpg com variáveis explicativas sendo horsepower, 
# 2.