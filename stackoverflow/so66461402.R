df_initial <- 
  structure(list(Date = structure(c(18681, 18681, 18681, 18681, 
                                    18682, 18682, 18682, 18682, 18683, 18683, 18683, 18683, 18684, 
                                    18684, 18684, 18684, 18685, 18685, 18685, 18685, 18686, 18686, 
                                    18686, 18686), class = "Date"), index_name = c("INDU Index", 
                                                                                   "SPX Index", "TPX Index", "MEXBOL Index", "INDU Index", "SPX Index", 
                                                                                   "TPX Index", "MEXBOL Index", "INDU Index", "SPX Index", "TPX Index", 
                                                                                   "MEXBOL Index", "INDU Index", "SPX Index", "TPX Index", "MEXBOL Index", 
                                                                                   "INDU Index", "SPX Index", "TPX Index", "MEXBOL Index", "INDU Index", 
                                                                                   "SPX Index", "TPX Index", "MEXBOL Index"), index_level = c(31537.35, 
                                                                                                                                              3881.37, NA, 45268.33, 31961.86, 3925.43, 1903.07, 45151.38, 
                                                                                                                                              31402.01, 3829.34, 1926.23, 44310.27, 30932.37, 3811.15, 1864.49, 
                                                                                                                                              44592.91, NA, NA, NA, NA, NA, NA, NA, NA), totalReturn_daily = c(0.0497, 
                                                                                                                                                                                                               0.1277, 0, 0.7158, 1.3461, 1.1364, -1.8201, -0.1151, -1.7181, 
                                                                                                                                                                                                               -2.4339, 1.2411, -1.8629, -1.4628, -0.4636, -3.2052, 0.6379, 
                                                                                                                                                                                                               0, 0, 0, 0, 0, 0, 0, 0)), row.names = c(NA, -24L), groups = structure(list(
                                                                                                                                                                                                                 index_name = c("INDU Index", "MEXBOL Index", "SPX Index", 
                                                                                                                                                                                                                                "TPX Index"), .rows = structure(list(c(1L, 5L, 9L, 13L, 17L, 
                                                                                                                                                                                                                                                                       21L), c(4L, 8L, 12L, 16L, 20L, 24L), c(2L, 6L, 10L, 14L, 
                                                                                                                                                                                                                                                                                                              18L, 22L), c(3L, 7L, 11L, 15L, 19L, 23L)), ptype = integer(0), class = c("vctrs_list_of", 
                                                                                                                                                                                                                                                                                                                                                                                       "vctrs_vctr", "list"))), row.names = c(NA, -4L), class = c("tbl_df", 
                                                                                                                                                                                                                                                                                                                                                                                                                                                  "tbl", "data.frame"), .drop = TRUE), class = c("grouped_df", 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "tbl_df", "tbl", "data.frame"))


library(zoo)
df_initial %>%
  group_by(index_name) %>% 
  mutate_at(vars(-totalReturn_daily),
            ~ na.locf(., na.rm = FALSE)) %>% 
  dplyr::filter(index_name == "TPX Index") 


df_initial %>%
  group_by(index_name) %>% 
  mutate(across(
    .cols = -c(totalReturn_daily),
    .fns  = ~ na.locf(., na.rm = FALSE)
  )) %>%
  ungroup() %>% 
  dplyr::filter(index_name == "TPX Index")
