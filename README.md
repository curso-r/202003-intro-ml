
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Configuração inicial

#### Passo 1: Instalar pacotes

``` r
install.packages("remotes")

# instalar pacote da Curso-R
remotes::install_github("curso-r/CursoR")

# instalar pacotes que vamos usar durante o curso
CursoR::instalar_dependencias()
```

#### Passo 2: Criar um projeto do RStudio

Faça um projeto do RStudio para usar durante todo o curso e em seguida
abra-o.

``` r
install.packages("usethis")
usethis::create_package("caminho_ate_o_projeto/nome_do_projeto")
```

#### Passo 3: Baixar o material

Certifique que você está dentro do projeto criado no passo 2 e rode o
código abaixo.

**Observação**: Assim que rodar o código abaixo, o programa vai pedir
uma escolha de opções. Escolha o número correspondente ao curso de
Introdução ao Machine Learning\!

``` r
# Baixar ou atualizar material do curso
CursoR::atualizar_material()
```

## Slides

| slide                                    | link                                                                              |
| :--------------------------------------- | :-------------------------------------------------------------------------------- |
| slides/00-intro-curso.html               | <https://curso-r.github.io/main-intro-ml/slides/00-intro-curso.html>              |
| slides/01-intro-ml.html                  | <https://curso-r.github.io/main-intro-ml/slides/01-intro-ml.html>                 |
| slides/03-modelos-de-arvores.html        | <https://curso-r.github.io/main-intro-ml/slides/03-modelos-de-arvores.html>       |
| slides/03-modelos-de-arvores\_cache/html | <https://curso-r.github.io/main-intro-ml/slides/03-modelos-de-arvores_cache/html> |
| slides/04-dataprep.html                  | <https://curso-r.github.io/main-intro-ml/slides/04-dataprep.html>                 |

## Scripts usados em aula

| script                    | link                                                                          |
| :------------------------ | :---------------------------------------------------------------------------- |
| 01-arvores-2.R            | <https://curso-r.github.io/202003-intro-ml/scripts/01-arvores-2.R>            |
| 01-arvores.R              | <https://curso-r.github.io/202003-intro-ml/scripts/01-arvores.R>              |
| 01-split.R                | <https://curso-r.github.io/202003-intro-ml/scripts/01-split.R>                |
| 02-cv.R                   | <https://curso-r.github.io/202003-intro-ml/scripts/02-cv.R>                   |
| 02-modelos-lineares.R     | <https://curso-r.github.io/202003-intro-ml/scripts/02-modelos-lineares.R>     |
| 02-regularizacao.R        | <https://curso-r.github.io/202003-intro-ml/scripts/02-regularizacao.R>        |
| 03-logistic\_reg.R        | <https://curso-r.github.io/202003-intro-ml/scripts/03-logistic_reg.R>         |
| 05-exemplo-arvore.R       | <https://curso-r.github.io/202003-intro-ml/scripts/05-exemplo-arvore.R>       |
| 05-exemplo-arvore2.R      | <https://curso-r.github.io/202003-intro-ml/scripts/05-exemplo-arvore2.R>      |
| 05-random-forest.R        | <https://curso-r.github.io/202003-intro-ml/scripts/05-random-forest.R>        |
| 06-adult-recipes.R        | <https://curso-r.github.io/202003-intro-ml/scripts/06-adult-recipes.R>        |
| 06-hitters-recipes.R      | <https://curso-r.github.io/202003-intro-ml/scripts/06-hitters-recipes.R>      |
| 06-laboratorio-de-steps.R | <https://curso-r.github.io/202003-intro-ml/scripts/06-laboratorio-de-steps.R> |
| 06-xgboost.R              | <https://curso-r.github.io/202003-intro-ml/scripts/06-xgboost.R>              |
| misc-xgboost-gif.R        | <https://curso-r.github.io/202003-intro-ml/scripts/misc-xgboost-gif.R>        |
