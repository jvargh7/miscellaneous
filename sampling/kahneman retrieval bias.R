x = MASS::mvrnorm(n=100,mu = c(0,0),Sigma = rbind(c(1,0.35), c(0.35,1)))
res = numeric()

cor(x[,1],x[,2])

for(i in 1:1000){
  
  s = sample(1:100,size=2,replace=TRUE)
  
  res[i] = ifelse((x[s[1],1] > x[s[2],1]),
                  ifelse(x[s[1],2] > x[s[2],2],1,0),NA)
  
}

table(res)
