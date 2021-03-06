# caret demo
# December 6 2018
# JSC

## caret = Classification and REgression Training
## wrapp for >300 model training techniques
## function for plotting and summarizing model performance

library(caret)
library(patchwork)
library(tidyverse)
set.seed(1235)

# load data and fix col names
load("wine.Rda")
colnames(wine) = make.names(colnames(wine))

# peek structure of data
str(wine)
head(wine)

# view dist. of variables
wine_long = gather(wine, attr, val, -class)
ggplot(wine_long, aes(val)) + geom_density() + 
  geom_histogram(aes(y= ..density..), bins=30, alpha=.7) +
  facet_wrap(.~attr,scales="free")

# "recipe" for developing a model:
## 1. prepare data(separate + preprocessing)
## 2. train on training
## 3. predict on test

## minimal working example

# partition data: prop. of classes is preserved
part = createDataPartition(wine$class, p=.8, list=F)
train = wine[part, ] 
test = wine[-part, ]

# all should be rougly equal
prop.table(table(wine$class))
prop.table(train(wine$class))
prop.table(table(test$class))

# train a model using the "rpart" method
rpart_model_wine = train(class ~ ., data=train, method="rpart")

# view model summary
rpart_model_wine

# make predictions
rpart_wine_predict = predict(rpart_model_wine, newdata=test)
head(rpart_wine_predict)

# buidle a better model


# preprocessing
preproc_values = preProcess(train, method=c("center","scale"))
train = predict(preproc_values, train)
test = predict(preproc_values, test)
head(train)

# specify parameters and resampling
modelLookup("nnet")
param_grid = expand.grid(.decay=c(.8,.2,.05), size=c(1,3,5))
resample_type = trainControl(method="LGOCV")

# pass to train function
nnet_model_wine = train(class ~ ., data = train, method = "nnet",
                        tuneGrid = param_grid,
                        trControl = resample_type,
                        maxit = 200)


# visualize trainign process
nnet_model_wine
p = ggplot(nnet_model_wine) | ggplot(nnet_model_wine,metric = "Kappa")

p / ggplot(nnet_model_wine, plotType = "level")

# resampleperformance for final model
resampleHist(nnet_model_wine)

# get prediction and summarize predictive power
nnet_wine_predict = predict(nnet_model_wine, newdata = test)
confusionMatrix(nnet_wine_predict, test$class)

# variable imporatance: which vars matter for prediction
imp = varImp(nnet_model_wine)
imp


# plot the importance
imp_df = data.frame("attr" = rownames(imp[[1]]),
                    "imp" = imp[[1]][,1])
ggplot(imp_df, aes(y=imp, x=attr)) + geom_col() + coord_flip()


ggplot(wine_long, aes(x=class, y=val, col=class) + geom_boxplot() +
         facet_wrap(.~attr, scale="free")

