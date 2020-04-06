library(tidyverse)
library(rpart)
library(rpart.plot)
dados <- tribble(
  ~Pressão,	~Glicose,	~Diabetes,
  "hipertensao",	92,	"nao",
  'normal'	,130,	"sim",
  "normal"	,130,	"nao",
  "normal",	55,	"nao",
  "hipertensao"	,220,	"sim",
  "normal"	,195,	"sim"
)

fit <- rpart(Diabetes ~ ., dados, control = rpart.control(cp = -1, minsplit = 0))
rpart.plot(fit)

fit$cptable
