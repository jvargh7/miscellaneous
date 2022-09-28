set.seed(42)  
n <- 6
dat <- data.frame(id=rep(1:n, 2), 
                  group= as.factor(rep(LETTERS[1:2], n/2)),
                  V1 = rnorm(n),
                  V2 = runif(n*2, min=0, max=100), 
                  V3 = runif(n*2, min=0, max=100),
                  V4 = runif(n*2, min=0, max=100),
                  V5 = runif(n*2, min=0, max=100))



# library(broom.mixed)
library(lme4)
library(purrr)
library(tidyr)
# Add list of variable names to the vector below...
var_list <- c("V1","V2","V3","V4","V5")


map_dfr(var_list,
                  function(x){
                    formula_mlm = as.formula(paste0(x,"~ group + (1|id)"));
                    model_fit = lmer(formula_mlm,data=dat);
                    re_variances = VarCorr(model_fit,comp="Variance") %>% 
                      data.frame() %>% 
                      dplyr::mutate(variable = x);
                    return(re_variances)
                  }) %>% 
  dplyr::select(variable,grp,vcov) %>% 
  pivot_wider(names_from="grp",values_from="vcov") %>% 
  dplyr::mutate(icc = id/(id+Residual))
