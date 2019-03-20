## Classification Using Decision Tree

## credit에 credit.csv 데이터 복사
credit <- read.csv("credit.csv")

set.seed(123)

## 1000개중에 900개만 랜덤 선택
train_sample <- sample(1000, 900)

## credit 데이터의 1행부터 900번째 행까지의 데이터를 credit_train에 복사
credit_train <- credit[train_sample, ]

## 나머지인 901번 행부터 1000번째 행까지의 데이터를 credit_test에 복사
credit_test <- credit[-train_sample, ]

prop.table(table(credit_train$default))

## decision tree model 을 training 하기 위한 package
library(C50)

## credit_train[-17] : credit_train의 마지막 열을 제외한 값(마지막 열 : default)
credit_model <- C5.0(credit_train[-17], credit_train$default)

credit_model

summary(credit_model)

## evaluating model performance

## predict() 함수를 이용하여 training 된 모델에 credit_test를 적용
credit_pred <- predict(credit_model, credit_test)

library(gmodels)

CrossTable(credit_test$default, credit_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))



## improving model performance

credit_boost10 <- C5.0(credit_train[-17], credit_train$default, trials = 10)

summary(credit_boost10)

credit_boost_pred10 <- predict(credit_boost10, credit_test)

CrossTable(credit_test$default, credit_boost_pred10, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))
