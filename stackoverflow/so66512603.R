df <- data.frame(
  patients = c(rep(1,6),rep(2,6)),
  time = rep(letters[1:6],2),
  status = c(rep(5,6),rep(4,2),rep(5,4))
)

df %>% 
  group_by(patients) %>% 
  dplyr::filter(status*6 != sum(status))

