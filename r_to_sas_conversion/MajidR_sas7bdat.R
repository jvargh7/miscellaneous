load("C:/Cloud/Box Sync/Unjali R to SAS Conversion/Majid_R.RData")
# data <- readRDS("C:/Cloud/Box Sync/Unjali R to SAS Conversion/MajidR.RDS")

data <- data %>% 
  dplyr::rename(
    inf_factor_fgl = inf.factor.fgl
  )

haven::write_sas(data,"C:/Cloud/Box Sync/Unjali R to SAS Conversion/Majid_R.sas7bdat")
haven::write_dta(data,"C:/Cloud/Box Sync/Unjali R to SAS Conversion/Majid_R.dta",version=12)