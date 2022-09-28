### Fit the stock recruit model
library(bbmle)
library(nlraa)
Dat43 <- Dat[c(1:19),c(3,4)]
names(Dat43) <- c("X","Y")
bevholt = function(S, a, b) {
  S * a/(b + S)
}
maxY <- max(Dat43$Y)

fit43 <- nls(Y ~ bevholt(X, a, b), start = list(a = maxY, b = maxY), data = Dat43)

###Bootstrap CI's
library(nlraa)
fit43.Bt <- boot_nls(fit43, psim = 3)
fit43.Bt.prms <- na.omit(fit43.Bt$t)
nrb <- length(unique(Dat43$X))
nrp <- nrow(fit43.Bt.prms)

for(i in 1:nrp){
  a.i <- fit43.Bt.prms[i,1]
  b.i <- fit43.Bt.prms[i,2]
  
  prd.dat[c(1 + (nrb*(i - 1))):c(i * nrb),3] <- bevholt(unique(Dat43$X), a.i, b.i)
}

fit43nls <- nls(Y ~ bevholt(X, a, b), start = list(a = maxY, b = maxY), data = Dat43)
fit43nls.bt1 <- boot_nls(fit43nls, fitted, psim = 3, R = 999)

lwr1.q <- apply(t(fit43nls.bt1$t), 1, quantile, probs = 0.05, na.rm = TRUE)
upr1.q <- apply(t(fit43nls.bt1$t), 1, quantile, probs = 0.95, na.rm = TRUE)

ggplot() + 
  geom_point(data = Dat43, aes(x = X, y = Y)) + 
  geom_line(data = Dat43, aes(x = X, y = fitted(fit43nls))) + 
  geom_ribbon(aes(x = Dat43$X, ymin = lwr1.q, ymax = upr1.q), 
                    +                 fill = "purple", alpha = 0.2) + 
  ggtitle("B-H fit with bootstrapped 90% confidence band for the mean function")+
  ylab("Age 4") + xlab("Age 3") +
  theme_bw()

###Predict a value
new.3s<-data.frame(X=c(5000))
###> new.3s
###     X
###1 5000
predict(fit43, newdata = new.3s)