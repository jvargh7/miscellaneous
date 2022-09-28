data("mtcars")


for(v in names(mtcars)){
  plot(mtcars[,v],mtcars$disp,xlab = v,ylab="disp")
}

for (col in names(Boston)) {
  plot(Boston[,col], Boston$crim,xlab=col,ylab="crim")
}

