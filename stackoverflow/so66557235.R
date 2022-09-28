fun = function(x) {(x/4)*exp((-x^2)/8)}
integrate(fun,0,Inf)

# Mean
fun2 = function(x) {x*fun(x)}
integrate(fun2,0,Inf)

# Variance
fun3 = function(x){(x-2.506628)^2 * fun(x)}
integrate(fun3,0,Inf)




