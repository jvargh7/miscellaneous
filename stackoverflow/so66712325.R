set.seed(42)  
n <- 6
dat <- data.frame(id=rep(1:n, 2), 
                  group= as.factor(rep(LETTERS[1:2], n/2)),
                  VD1 = rnorm(n),
                  VD2 = runif(n*2, min=0, max=100), 
                  VD3 = runif(n*2, min=0, max=100),
                  VD4 = runif(n*2, min=0, max=100),
                  VD5 = runif(n*2, min=0, max=100))



library(broom.mixed)
library(lme4)
library(purrr)

var_names <- names(dat)[3:7]

output <- map_dfr(var_names,
                  function(x){
                    formula_mlm = as.formula(paste0(x,"~ group + (1|id)"));
                    model_fit = lmer(formula_mlm,data=dat) %>% 
                      tidy(.) %>% 
                      dplyr::mutate(variable = x);
                    return(model_fit)
                    
                  })
output %>% 
  head(.)
