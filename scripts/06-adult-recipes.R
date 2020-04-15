# pacotes 
library(tidyverse)
library(tidymodels)
library(purrr)

#####################################################################################################
# PASSO 0) CARREGAR AS BASES

# Download dos dados -----------------------------------------------------------------------------

# baixa adult.data se nao existe ainda
if(!file.exists("dados/adult.data")) 
  httr::GET("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data", httr::write_disk("dados/adult.data"))

# baixa adult.test se nao existe ainda
if(!file.exists("dados/adult.test"))
  httr::GET("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.test", httr::write_disk("dados/adult.test"))

# baixa adult.names se nao existe ainda
if(!file.exists("dados/adult.names"))
  httr::GET("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.names", httr::write_disk("dados/adult.names"))

# Carrega dados ---------------------------------------------------------------------------------------

# prepara os nomes das colunas para colocar no cabecalho
adult_names <- tibble(name = read_lines("dados/adult.names")) %>%
  filter(
    str_detect(name, "^[^\\|].*:")
  ) %>%
  separate(name, c("name", "description"), sep = ":") %>%
  mutate(
    name = snakecase::to_snake_case(name)
  ) %>%
  add_row(name = "less_than_50k", description = "person earn more than USD 50K per year.")


# treino/teste -------------------------------------------
adult_train <- read_csv(file = "dados/adult.data", na = c("?", "", "NA"), col_names = adult_names$name)
adult_test  <- read_csv(file = "dados/adult.test", na = c("?", "", "NA"), col_names = adult_names$name, skip = 1) %>%
  mutate(
    less_than_50k = if_else(less_than_50k == "<=50K.", "<=50K", ">50K")
  )

# exploracao --------------------------------------------
glimpse(adult_train)
skim(adult_train)
skim(adult_test)

plot_bar(adult_train)
plot_histogram(adult_train)
plot_histogram(adult_train %>% mutate_if(is.numeric, log1p))
plot_qq(adult_train)
plot_qq(adult_train %>% mutate(capital_saldo = capital_gain + capital_loss) %>% mutate_if(is.numeric, log1p))
plot_correlation(na.omit(adult_train), maxcat = 5L)
plot_correlation(na.omit(adult_train), type = "c")
gg_miss_var(adult_train)
vis_miss(adult_train)
gg_miss_case(adult_train)

# dataprep com recipe -----------------------------------
adult_recipe <- recipe(less_than_50k ~ age, data = adult_train)

# modelo ------------------------------------------------
adult_lr_model <- logistic_reg(penalty = tune()) %>%
  set_mode("classification") %>%
  set_engine("glmnet")

# workflow -----------------------------------------------
adult_lr_workflow <- workflow() %>% 
  add_model(adult_lr_model) %>% 
  add_recipe(adult_recipe) 

# reamostragem -------------------------------------------
set.seed(1)
adult_resamples <- vfold_cv(adult_train, v = 5)

# tune grid ----------------------------------------------
adult_lr_tune_grid <- adult_workflow %>%
  tune_grid(adult_resamples)

# modelo final -------------------------------------------
adult_lr_best <- select_best(adult_lr_tune_grid, "roc_auc")
adult_lr_fit <- adult_workflow %>%
  finalize_workflow(adult_lr_best) %>%
  fit(adult_train)


