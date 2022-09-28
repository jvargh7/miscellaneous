
zip = c(35758, 35811,35749,34234,34324)

Fct2 <- case_when(zip == 35758 ~ 1,
                  zip == 35811 ~ 2,
                  zip == 35749 ~ 3,
                  TRUE ~ 0) %>% as.factor()
