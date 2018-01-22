library(MASS)
library(ISLR)
library(caret)

head(Smarket)

lda.fit=lda(Direction∼Lag1+Lag2 ,data=Smarket ,subset =train)

head(Smarket)

df= Smarket
## R For Classification


head(df)

validation_index <- createDataPartition(df$Direction, p=0.80, list = FALSE)
# select 20% of the data for validation
validation <- df[-validation_index,]
# use the remaining 80% of data to training and testing the models
dataset <- df[validation_index,]


control <- trainControl(method="cv",     # cross-validation set approach to use
                        number=5,       # k number of times to do k-fold
                        classProbs = T,  
                        summaryFunction = twoClassSummary,
                        allowParallel=T
)



set.seed(7)
fit.lda <- train(Direction~., data=dataset, method="lda",metric="ROC", trControl=control)

print(fit.lda)

predictions = predict(fit.lda,validation)

confusionMatrix(predictions,validation$Direction)

# library(pROC)
# 
# rf_full_roc <- roc(cross_val$is_churn,test_probs$X1,percent = T,plot = T,ci = T,auc = T,print.auc =T)
# 
# rf_full_auc <- auc(rf_full_roc)

