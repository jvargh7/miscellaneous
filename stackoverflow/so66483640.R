library(splines)

# generating the data

x_ = c(0.2, 0.9, 1.4, 1.7)
y_ = c(2.5, 4.3, 5.2, 2.5)
n = 50 - length(x_)
set.seed(0)
x = seq(0,3, length.out=n) + runif(n,0,0.1)
y = x*sin(3*x) + runif(n)
x = sort(c(x, x_))
y = c(y, y_)
df <- data.frame(x=sort(x), y=y)

# fitting the model
knots = 2
df1 <- df[c(2,4,6,8,16,20,25,30,35,40,45,50),]
# ft <- lm(y ~ bs(x, knots=knots, degree=3),data=df1)
ft <- lm(df1$y ~ bs(df1$x, knots=knots, degree=3))

ft <- lm(y ~ bs(x, knots=knots, degree=3),data=df1)
pr <- predict(ft, newdata=df)
length(pr)
