ds <- data.frame(fine_motor = c("2.2", "2.2"), 
                     skill = c("B. Functional Use","A. Reach, Grab, Release"), 
                     spread_sheet_id_3 = c(1, 1), 
                     score_s_4 = c(2,2), 
                     confirm_s_5 = c("Meets", "Meets"), 
                     spread_sheet_id_7 = c(2,2), 
                     score_s_8 = c(2, 2), 
                     confirm_s_9 = c("Meets", "Meets"), 
                     spread_sheet_id_11 = c(3,3), score_s_12 = c(2, 2), confirm_s_13 = c("Meets", "Meets"), 
                     spread_sheet_id_15 = c(4, 4),score_s_16 = c(1, 2), confirm_s_17 = c("Inconsistent","Meets")) 

ds %>% 
  pivot_longer(-one_of("fine_motor","skill"),
               names_to = c(".value","group"),
               names_sep = "[0-9]+"
  ) %>% 
  dplyr::select(-group)
