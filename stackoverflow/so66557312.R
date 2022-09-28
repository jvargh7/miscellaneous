x = sort(runif(n = 1e6))
L = sort(runif(n = 100))
index = sapply(L, function(l) which.max(x>l))
L[]