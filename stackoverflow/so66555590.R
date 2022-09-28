df = data.frame(aa = 1:10, bb = NA, cc = 5)

df %>%
  mutate(c = ifelse(is.na(bb), grepl('a', names(.)), cc))

df %>% 
  mutate(c = ifelse(is.na(bb),.[,grepl('a',names(.))],cc))
