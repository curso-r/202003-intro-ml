library(tidymodels)
# laboratorio de steps

receita <- recipe(disp ~ ., data = mtcars)

receita %>% prep %>% juice


# dados novos
mtcars_novos <- mtcars

receita %>% bake(new_data = mtcars_novos)
