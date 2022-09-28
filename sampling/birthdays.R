
d = 365

out = list()

for (r in 1:100){
  
  temp = list()
  i = r
  while(i>0){
    temp[i] = choose(d-(i-1),k = 1)/365
    i = i -1
    
  }
  
  out[r] = 1 - prod(unlist(temp))
}

plot(out)
out

plot(1:100,y=unlist(out))
