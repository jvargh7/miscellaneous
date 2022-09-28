library(tidyverse)

df = read.table(header = TRUE,text = 'producto |   GDA            FOPWL   |     Total
         6 |         0                 1 |         1 
         7 |         8                 0 |         8 
         8 |        12                3 |        15 
         9 |        38              19 |        57 
        10 |        59             49 |       108 
        11 |        45             40 |        85 
        12 |        60             41 |       101 
        13 |        82            71 |       153 
        14 |        52            43 |        95 
        15 |        21            28 |        49 
        16 |         5             17 |        22 
        17 |         5               8 |        13 
        18 |         1               2 |         3 
        19 |         0               2 |         2
') %>% 
  dplyr::select(-starts_with("X"))

df %>% 
  ggplot(data=.,aes(x=producto,y=Total)) +
  geom_col() +
  theme_bw() +
  scale_x_continuous(breaks=seq(4,20,by=2))
