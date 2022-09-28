
cor5.mat_1 <- matrix(rnorm(10000),nrow=100,ncol=100)

cor5.mat_1 <- cor5.mat
cor5.mat_1[cor5.mat_1==0] <- NA

cor(cor5.mat_1[,-1],use="pairwise.complete.obs")
