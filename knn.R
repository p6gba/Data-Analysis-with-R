## knn을 통해 Benign과 Malignat를 예측
## Classification Using Nearest Neighbors

## wbcd에 wbsc_bc_data.csv 데이터 복사
wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

## wbcd의 첫번째 열은 id값이므로 필요없으므로 삭제 후 다시 저장
wbcd <- wbcd[-1]

## wbcd 의 diagnosis attribute 의 데이터를 B, M에서 Benign과 Malignant로 바꿈
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"), labels = c("Benign", "Malignant"))

## 정규화 함수 구현
normalize <- function(x){return ((x-min(x))/(max(x)-min(x)))}

## wbcd_n 에 wbcd의 첫번째 열(Benign, Malignant)을 제외한 나머지를 정규화함
## 데이터간 크기의 차이가 너무많이 나서
## 정규화(0~1사이의 숫자로 바꿔줌)를 하여 다시 저장
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

## wbcd_train 에 정규화된 데이터의 1부터 469까지 469개의 행을 저장
wbcd_train <- wbcd_n[1:469,]

## wbcd_test 에 정규화된 데이터의 470부터 569까지 100개의 행을 저장
wbcd_test <- wbcd_n[470:569,]

## wbcd_train_labels에 wbcd의 1부터 469까지의 행과 첫번째 열(Benign, Malignant)을 저장
wbcd_train_labels <- wbcd[1:469, 1]

## wbcd_test_labels에 wbcd의 470부터 569까지의 행과 첫번째 열(Benign, Malignant)을 저장
wbcd_test_labels <- wbcd[470:569, 1]

## class package 설치 및 선언
install.packages("class")
library(class)

## wbcd_test_pred에 knn 함수를 통해 k가 21인 모델을 training 
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k = 21)

## CrossTable을 통해 predict된 테스트 데이터와 테스트 labels를 비교해봄
CrossTable(x=wbcd_test_labels, y=wbcd_test_pred, prop.chisq=FALSE)
