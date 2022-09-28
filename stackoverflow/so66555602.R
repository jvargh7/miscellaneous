library(dplyr)

df <- data.frame(Dose   = c(1,1,    1,  1,  1,  1,  10, 10, 10, 10, 10, 10),
                 Route  = c('IV','IV','IV','PO','PO','PO','IV','IV','IV','PO','PO','PO'),
                 Timepoint = c(0.25,0.25,0.25,0.25,0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5),
                 value =    c(207,181,201,505,180,309,123,122,137,441,335,402))


mean.df <-  df %>% group_by(Timepoint, Dose, Route) %>% summarize(mean_value=mean(value))
