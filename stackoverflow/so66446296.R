# https://stackoverflow.com/questions/66446296/r-function-for-cdf-for-difference-of-two-uniform-distributions


UniformDiffCDF <- function(alow,ahigh,blow,bhigh,cutoff,n=10000){
  a = runif(n,min=alow,max=ahigh)
  b = runif(n,min=blow,max=bhigh)
  z = (a-b)
  p = sum(z<cutoff)/n
  return(p)
 }

UniformDiffCDF(10,20,5,15,3)

