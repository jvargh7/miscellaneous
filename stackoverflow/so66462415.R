df <- structure(list(Game = c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L), 
               Player = c("ABA 02", "ABA 04", "ABA 46", "ABA 02", "ABA 04", 
                          "ABA 46", "BRS 03", "BRS 05", "BRS 03"), Player_Grade = c("ABA 02 (1.5); ABA 04 (0.2); ABA 46 (3.0)  ", 
                                                                                    "ABA 02 (1.5); ABA 04 (0.2); ABA 46 (3.0)  ", "ABA 02 (1.5); ABA 04 (0.2); ABA 46 (3.0)  ", 
                                                                                    "ABA 02 (1.2); ABA 04 (3.2); ABA 46 (8.1)  ", "ABA 02 (1.2); ABA 04 (3.2); ABA 46 (8.1)  ", 
                                                                                    "ABA 02 (1.2); ABA 04 (3.2); ABA 46 (8.1) ", "BRS 03 (1.7); BRS 05 (1.2); BRS 01 (2.5)", 
                                                                                    "BRS 03 (1.7); BRS 05 (1.2); BRS 01 (2.5)", "BRS 03 (1.7); BRS 05 (1.2); BRS 01 (2.5)"
                          )), class = "data.frame", row.names = c(NA, -9L))
  
  mutate(df,Grade = map2(Player_Grade,Player,function(x,y) str_replace(y, paste0(x," \\([0-9\\.]\\)"),replacement = "")))
  mutate(df,Grade = purrr::map2(Player_Grade,Player,
                         function(x,y) sub(paste0(".*",y," \\(([0-9\\.]+)\\).+"), "\\1", x)))

  
y = "ABA 02 (+1.5); ABA 04 (-0.2); ABA 46 (+3.0)  "  
sub(".*ABA 02 \\(((\\+|\\-)*[0-9\\.]+)\\).+", "\\1", y)                        
