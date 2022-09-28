
# https://topepo.github.io/caret/available-models.html
ifelse(!require(caret),install.packages("caret"),print("caret is available"))
library(caret)

# For ROSE: You need the 'ROSE' package
# For SMOTE: You need the 'DMwR' package

# Hyperparameters for the 'ranger' package
# The name is kept for the do.call below
tuneGrid = expand.grid(mtry=seq(10,50,by=10),
                              splitrule="gini",
                              min.node.size=seq(30,150,by=30))


train_control <- trainControl(method = "cv",
                              number = 5,
                              verboseIter=TRUE,
                              returnData=FALSE,
                              classProbs = TRUE,
                              sampling = "smote", #Check documentation for other strategies
                              summaryFunction = twoClassSummary) #Use multiClassSummary for multi-class classification


common_params <- list(
  form=as.formula(paste0(Y," ~ .")), #Requires your outcome to be stored as "Y". 
  data=X, # Your predictors
  metric="ROC", # Use "logLoss" for multi-class classification
  trControl=train_control
)

params <- c(common_params, tuneGrid)

fit <- do.call(caret::train, params)

# Alternatively:
fit <- train(X,Y,method="ranger",
             trControl=train_control,
             tuneGrid = tuneGrid
             )


## Example: This is not an unbalanced dataset but the code should work
data(iris)


X <- iris %>% 
  dplyr::filter(Species!="setosa")  %>% 
  dplyr::select(-Species)
Y <- iris %>% 
  dplyr::filter(Species!="setosa") %>% 
  dplyr::mutate(Species=as.character(Species))   %>%
  dplyr::select(Species) %>% pull()

# Modified the tuning grid above for the dataset

iris_tuneGrid = expand.grid(mtry=c(2,3),
                       splitrule="gini",
                       min.node.size=seq(5,20,by=5))


fit <- train(X,Y,method="ranger",
             trControl=train_control,
             tuneGrid = iris_tuneGrid,
             # You can use alternate measures to be optimized but they have to be available in the "summaryFunction"
             metric="ROC") 

plot(fit)
