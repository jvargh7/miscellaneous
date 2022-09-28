
dat = read.table(text='IDNo  cigsaday   activity  
    1      NA        1           
    2      NA        1          
    1       5       NA          
    2       5       NA  ',header=TRUE)

library(zoo)

dat %>% 
  group_by(IDNo) %>% 
  mutate_at(vars(-group_cols()),.funs=function(x) na.locf(x)) %>% 
  distinct(IDNo,cigsaday,activity,.keep_all = TRUE) %>% 
  ungroup()
