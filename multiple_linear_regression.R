## Regression을 통해 fireforest area 예측
## Multiple Linear Regression

forestfire <- read.csv("forestfires.csv", stringsAsFactors = TRUE)

## A correlation matrix provides a quick overview of how the independent variables are related to the dependent variable
cor(forestfire)

## It can also be helpful to visualize the relationships among numeric features by using a scatterplot matrix
pairs(forestfire)

## training a model on the data

## lm : Linear Model
## forestfire 데이터의 attribute인 area 와 나머지 attributes 를 training
forestfire_model <- lm(area~., data = forestfire)

forestfire_model

summary(forestfire_model)
