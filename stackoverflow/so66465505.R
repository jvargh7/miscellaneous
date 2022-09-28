# https://stackoverflow.com/questions/66465570/how-to-make-combination-between-the-fields-in-2-columns
df <- data.frame(v1 = c("PEX10",       
                  "SKI",         
                  "MORN1;RER1",  
                  "MORN1;RER1",  
                  "BEST4"),
           v2 = c("TPRG1L",
                  "MORN1;RER1",
                  "TTC34",
                  "TP73;WRAP73",
                  "TCTEX1D4;PLK3;BTBD19")) 

v1_cols = sapply(df$v1,function(x) str_count(x,";")) %>% max()
v2_cols = sapply(df$v2,function(x) str_count(x,";")) %>% max()
df %>% 
  # mutate(index = 1:n()) %>% 
  separate(v1,into=paste0("v1_",c(1:(v1_cols+1))),sep=";") %>% 
  separate(v2,into=paste0("v2_",c(1:(v2_cols+1))),sep=";") %>% 
  pivot_longer(cols=starts_with("v1_"),names_to = "var1",values_to="char") %>% 
  pivot_longer(cols=starts_with("v2_"),names_to = "var2",values_to="char2") %>% 
  dplyr::select(char,char2) %>% 
  dplyr::filter(complete.cases(.))
