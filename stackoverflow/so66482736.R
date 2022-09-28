A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)
library(SingleCaseES)
LRRd(A_data = A, B_data = B, bias_correct = FALSE)

df = data.frame(y = c(A,B),
                x = c(rep("A",times=length(A)),rep("B",times=length(B))))

lm_out <- lm(y ~ x,data=df)

beta_0 <- coef(lm_out)[1] 
beta_1 <- coef(lm_out)[2] 

log(beta_0 + beta_1) - log(beta_0)
log(mean(B)) - log(mean(A)) 
