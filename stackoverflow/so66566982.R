myVec <- numeric(10)

myVec
apply(1:9, 1, function(i,a){ if(i%%2!=0) myVec[i] <-log(a)^i else myVec[i+1] <- a^i},3)
apply(matrix(1:9,nrow=9,ncol=1), 1, function(i,a){ if(i%%2!=0) myVec[i] <-log(a)^i else myVec[i+1] <- a^i},3)
sapply(1:9, function(i,a){ if(i%%2!=0) myVec[i] <-log(a)^i else myVec[i+1] <- a^i},3)

