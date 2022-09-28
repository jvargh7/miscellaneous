findMin <- function(x) {
  minX <- x[1] 
  position <- c()
  i <- 0
  pos = NA
  for (i in 1:length(x)) { 
    if(x[i] < minX){
      minX <- x[i]
      pos = i
    } 
  }
  return(pos)
}

x = rnorm(100)
findMin(x)
