source(paste0(path_support_repo,"/package/label_variable.R"))
multi_choice <- function(df,
                         var_name=character(),
                         var_labels = NULL,
                         choices=NULL){
  

  # df$var <- df[,var_name]
  
  for (choice in choices){
    new_var = paste0("d_",var_name,"_",choice)
    var_label = var_labels %>% 
      dplyr::filter(variable == var_name) %>% 
      dplyr::select(variable,label,levels) %>% 
      dplyr::mutate(level = str_split(levels,",")[[1]][choice]) %>% 
      dplyr::mutate(level = paste0(label,": ",level)) %>% 
      dplyr::select(level) %>% 
      pull()

    df <- df %>% 
      dplyr::mutate(!!new_var := case_when(is.na(!!rlang::sym(var_name)) ~ NA_real_,
                                           str_detect(pattern=as.character(choice),
                                                      string=!!rlang::sym(var_name)) ~ 1,
                                           TRUE ~ 0))
    
    labelled::var_label(df[[new_var]]) = var_label
    
  }

  
  return(df)
  
  
}

binary_choice <- function(var) {
  var = case_when(var %in% c("Yes","yes") ~ 1, 
            var %in% c("No","no") ~ 0, 
            TRUE ~ NA_real_)
  var <- label_factor(var,
                      levels_vec = c(0,1),
                      labels_vec =c("0, No","1, Yes"))
  return(var)
  
}


### KAP dataset -----

kap_contraception <- readxl::read_excel(paste0(path_kap_contraception,"/data/KAP_Contraception_data_16092019.xlsx")) %>% 
  rename(SOdn = SO,
         SO = SO__1
         ) %>% 
  rename_all(~tolower(.)) %>% 
  dplyr::mutate(saiucde = case_when(str_detect(saiucde,"^.*[N,n]ot [E,e]asy") ~ "No",
                                    str_detect(string=saiucde,pattern="^.*[E,e]asy") ~ "Yes",
                                    TRUE ~ NA_character_)) %>% 
  dplyr::mutate_at(vars(skppc:spub,saiucde,sals,spiucd:scfdi),~binary_choice(.))

kap_variable_labels <- readxl::read_excel(paste0(path_support_repo,"/contraception/contraception_variable_list.xlsx")) %>% 
  mutate(variable = tolower(variable))



kap_contraception <- multi_choice(kap_contraception,var_name = "spubm",choices=c(1:4),kap_variable_labels)
kap_contraception <- multi_choice(kap_contraception,var_name = "smiucd",choices=c(1:9),kap_variable_labels)
kap_contraception <- multi_choice(kap_contraception,var_name = "scc",choices=c(1:6),kap_variable_labels)
kap_contraception <- multi_choice(kap_contraception,var_name = "sciucd",choices=c(1:5),kap_variable_labels)
kap_contraception <- multi_choice(kap_contraception,var_name = "stiucdp",choices=c(1:5),kap_variable_labels)
kap_contraception <- multi_choice(kap_contraception,var_name = "sppr",choices=c(1:4),kap_variable_labels)
kap_contraception <- multi_choice(kap_contraception,var_name = "sptlr",choices=c(1:5),kap_variable_labels)

kap_contraception <- kap_contraception %>% 
  dplyr::mutate_at(vars(starts_with("d_")),~label_factor(.,
                                                         levels_vec = c(0,1),
                                                         labels_vec =c("0, No","1, Yes"))) %>% 
  dplyr::mutate(d_sed = case_when( str_detect(string=sedn, pattern="(9|10|11|12|SSLC|PUC|Diploma|II PU)") ~ 2,
                                   str_detect(string=sedn,pattern="[1-8]") ~ 1,
                                   TRUE ~ 3)) %>% 
  dplyr::mutate(d_sed = label_factor(d_sed,
                                   levels_vec = c(1:3),
                                   labels_vec = c("1, Primary or Middle School",
                                                  "2, High school or Diploma",
                                                  "3, University degree and above")),
                so = label_factor(so,
                                  levels_vec = c(1:3),
                                  labels_vec = c("1, Student",
                                                 "2, Housewife",
                                                 "3, Working")),
                smsd = as.numeric(smsd))

kap_contraception <- label_variables(kap_contraception,
                          var_labels=kap_variable_labels,
                          domain_name = "KAP")

kap_contraception <- kap_contraception %>% 
  dplyr::select(-doi) %>% 
  rename(sno = "s.no.")

saveRDS(kap_contraception,paste0(path_kap_contraception,"/working/kap_contraception.RDS"))
