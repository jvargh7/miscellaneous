dfr <- data.frame( ID= rep(seq (1, 60, 1), 10),natural=rnorm(600), Dist=sample(1:10, 100, 
                                                                               replace=TRUE))
dfr <- dfr[order(dfr$Dist), ]
dfr$natural <- replace(dfr$natural, which(dfr$natural < 0), NA)