## K-means Clustering
## K-means Algorithm 을 통한 Clustering

## iris data 이용
require("datasets")
data("iris")

## label 을 제외한 나머지는 iris.new에 저장
iris.new <- iris[,c(1,2,3,4)]

## label 을 iris.class 에 저장
iris.class <- iris[,"Species"]

## 정규화 함수 구현
normalize <- function(x){return ((x-min(x))/(max(x)-min(x)))}

## 정규화 함수를 적용
iris.new <- as.data.frame(lapply(iris.new, normalize))

## kmeans 함수를 통해 iris.new 의 data를 3개의 군집으로 나눔
result <- kmeans(iris.new, 3)

## kmeans 함수를 적용한 내용 시각화
par(mfrow=c(2,2))
plot(iris.new[c(1,2)], col=result$cluster)
plot(iris.new[c(1,2)], col=iris.class)
plot(iris.new[c(3,4)], col=result$cluster)
plot(iris.new[c(3,4)], col=iris.class)

## 모델 평가
table(result$cluster, iris.class)
