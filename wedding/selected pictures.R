library(tidyverse)
file_list <- list.files(recursive=TRUE,path="C:/Cloud/OneDrive - Emory University/Summer 2021/Wedding/Photography/Selected Photos")

data.frame(V1 = file_list) %>% 
  separate(col=V1,into=c("section","file_name"),sep = "/") %>% 
  dplyr::filter(!is.na(file_name)) %>% 
  writexl::write_xlsx(.,"C:/Cloud/OneDrive - Emory University/Summer 2021/Wedding/Photography/Jithin selected photos.xlsx")
  


