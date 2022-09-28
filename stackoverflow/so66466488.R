df = structure(list(Country = c("Hungary", "Hungary", "Hungary", "Hungary", 
                           "Hungary", "Hungary", "Hungary", "Hungary", "Hungary", "Hungary", 
                           "Hungary", "Hungary", "Italy", "Italy", "Italy", "Italy", "Italy", 
                           "Italy", "Italy", "Italy", "Italy", "Italy", "Italy", "Italy"
), Year = c(1998L, 1998L, 1998L, 1998L, 1998L, 1998L, 1998L, 
            2002L, 2002L, 2002L, 2002L, 2002L, 1996L, 1996L, 1996L, 1996L, 
            1996L, 1996L, 1996L, 2000L, 2000L, 2000L, 2000L, 2000L), Party = c("FIDESZ", 
                                                                               "MIEP", "FKgP", "Other", "SZDSZ", "Munklaspart", "Socialist Party ", 
                                                                               "FIDESZ", "MIEP", "Other", "SZDSZ", "Socialist Party ", "FIDESZ", 
                                                                               "MIEP", "FKgP", "Other", "SZDSZ", "Munklaspart", "Socialist Party ", 
                                                                               "FIDESZ", "MIEP", "Other", "SZDSZ", "Socialist Party "), Percentage = c(28.2, 
                                                                                                                                                       5.6, 13.8, 8.3, 7.9, 4.1, 32.3, 41.1, 4.4, 6.9, 5.6, 42.1, 28.2, 
                                                                                                                                                       5.6, 13.8, 8.3, 7.9, 4.1, 32.3, 41.1, 4.4, 6.9, 5.6, 42.1), Ideology = c("far-right", 
                                                                                                                                                                                                                                "far-right", "far-right", "other", "center", "center", "center", 
                                                                                                                                                                                                                                "far-right", "far-right", "other", "center", "center", "far-right", 
                                                                                                                                                                                                                                "far-right", "far-right", "other", "center", "center", "center", 
                                                                                                                                                                                                                                "far-right", "far-right", "other", "center", "center")), class = "data.frame", row.names = c(NA, 
                                                                                                                                                                                                                                                                                                                             -24L))



df %>% 
  mutate(Ideology = factor(Ideology,levels=c("center","other","far-right"),ordered=TRUE),
         Party = as.character(Party)) %>% 
  arrange(Ideology) %>% 
ggplot(data=., aes(x = (Year), 
                y = Percentage, 
                col = Party,
                fill = (Ideology) )  ) +
  geom_col (position = "fill") +
  scale_fill_manual(values = c("red", "white", "grey", "light grey")) +
  theme_classic() 
theme(axis.title.y=element_blank(),
      axis.text.y=element_blank(),
      axis.ticks.y=element_blank()) 
