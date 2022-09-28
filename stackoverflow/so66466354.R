df = data.frame(A = c("n1","n2","n3"))
df$B = list(1:2,3:5,6:9)

any(df[3,2][[1]] %in% 7)
