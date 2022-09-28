ID = 1:500
states = rep(c("TS", "NE", "AR", "MO", "WA"),times = c(100, 100, 100, 100, 100))
schools = randomNames::randomNames(500) ## 5 first last names separated by a space
Gender = rep(c("male", "female"),times = c(180,320))

item1 = runif(500, min=.05, max =.95);  ind1 <- which(item1 %in% sample(item1, 55)); item1[ind1]<-NA
item2 = runif(500, min=.66, max=1);  ind2 <- which(item2 %in% sample(item2, 200)); item2[ind2]<-NA
item3 = runif(500, min=.05, max=.85);  ind3 <- which(item3 %in% sample(item3, 155)); item3[ind3]<-NA
item4 = runif(500, min=.40, max=1);  ind4 <- which(item4 %in% sample(item4, 150)); item4[ind4]<-NA
item5 = runif(500, min=0, max=.99);  ind5 <- which(item5 %in% sample(item5, 100)); item5[ind5]<-NA

df = data.frame(ID, states, schools, Gender, item1, item2, item3, item4, item5)







# Bootstrapping -------

library(lavaan)

sem_pred <- function(data){
  
  syntaxScale = " 
Satisfaction =~ item1 + item2 + item3 + item4 + item5

Satisfaction ~~ 1*Satisfaction;
Satisfaction ~ 0;
"
  Fit_Scale = lavaan::cfa(model = syntaxScale, data = data, estimator = "MLR", std.lv = FALSE,missing="fiml")
  
  # summary(Fit_Scale, fit.measures = TRUE, rsquare = TRUE, standardized = TRUE)
  
  
  pred <- lavPredict(Fit_Scale,type="lv",se="standard") %>% 
    data.frame() %>% 
    dplyr::select(Satisfaction) %>% 
    pull()
  
  return(pred)
  
}

hist(sem_pred(df),main = "Satisfaction",xlab = "Factor score")

for (r in 1:n_replicates){
  
  boot_df <- df[sample(1:nrow(df),size = nrow(df),replace = TRUE),]
  
  
  
}



