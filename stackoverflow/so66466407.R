Value <- c(1, 3, 4, 5, 0, 210,
           2, 0.5, 7, 0, 201, 300,
           3, 0, 500, 6, 2, 1,
           8, 0, 200, 137, 0.76, 2.3)

Ingredient <- as.factor(c("A", "B", "C", "D", "E", "E",
                          "E" ,"F", "G", "H", "H", "H",
                          "A", "B", "B", "C", "D", "E",
                          "E", "F", "F", "F", "G", "H"))

Condition <- as.factor(rep(c(rep(1,6), rep(2, 6)),2))


df <- data.frame(Condition, Ingredient, Value)

df %>% 
  group_by(Condition) %>% 
  mutate(Consecutive = case_when(Ingredient == dplyr::lag(Ingredient) ~ TRUE,
                                 TRUE ~ FALSE)) %>% 
  ungroup()
