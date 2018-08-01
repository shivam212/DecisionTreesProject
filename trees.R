library(ISLR)
df <- College
library(caTools)
sample <- sample.split(df$Private,SplitRatio = 0.7)
train <- subset(df, sample == T)
test <- subset(df, sample == F)
library(rpart)
tree <- rpart(Private ~ .,method = 'class',data = train)
tree.preds <- predict(tree,test)
tree.preds <- as.data.frame(tree.preds)
for (i in 1:nrow(tree.preds)) {
  if(tree.preds[i,2]>0.5)
  {
    print(i)
    print(tree.preds[i,2])
    test$new[i] <- 'Yes'
  }
  else
    test$new[i] <- 'No'
}