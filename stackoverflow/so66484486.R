plot1 <- structure(list(Followup = structure(c(1L, 2L, 3L, 4L, 1L, 2L, 
                                               3L, 4L), .Label = c("Baseline", "6 months", "24 months", "48 months"
                                               ), class = "factor"), Nutrient = structure(c(1L, 1L, 1L, 1L, 
                                                                                            2L, 2L, 2L, 2L), .Label = c("Protein_g", "Fat_g"), class = "factor"), 
                        estimate_control = c(61.00596313, 65.53883145, 73.31875608, 
                                             78.91867614, 67.0690134, 60.01715111, 62.63232916, 82.27888654
                        ), lowCIcontrol = c(50.941157, 53.03671101, 59.93245069, 
                                            63.98993695, 53.7771638, 44.59304192, 45.56292816, 61.10072183
                        ), upCIcontrol = c(71.07076925, 78.0409519, 86.70506146, 
                                           93.84741533, 80.36086301, 75.44126031, 79.70173015, 103.45705126
                        ), inter_val = c(60.10474197, 60.46426229, 71.52401348, 77.26970387, 
                                         66.22599924, 40.25131748, 47.51238789, 74.312322), inter_lowCI = c(48.07336716, 
                                                                                                            45.44116548, 55.56009104, 59.53520327, 50.33704695, 21.7170307, 
                                                                                                            27.15616668, 49.15385617), inter_upCI = c(72.13611677, 75.48735912, 
                                                                                                                                                      87.4879359, 95.00420447, 82.11495155, 58.78560428, 67.86860908, 
                                                                                                                                                      99.47078784), p_Intervention = c(0.36882348, 0.00008475, 
                                                                                                                                                                                       0.17207734, 0.24888026, 0.5243924, 0, 0, 0.00009439)), row.names = c(5L, 
                                                                                                                                                                                                                                                            6L, 7L, 8L, 13L, 14L, 15L, 16L), class = "data.frame")

library(ggsignif)
plot1 = plot1 %>% 
  mutate(sig = case_when(p_Intervention < 0.01 ~ "***",
                         p_Intervention < 0.05 ~ "**",
                         p_Intervention < 0.1 ~ "*",
                         TRUE ~ ""))

ggplot(plot1, aes(factor(Nutrient), inter_val, fill = fct_rev(Followup))) + 
  geom_bar(stat="identity", position = "dodge") + 
  geom_errorbar(aes(ymin=inter_val-inter_lowCI, ymax=inter_val+inter_upCI), width=1, size=1,position="dodge") + 
  coord_flip() + 
  geom_text(aes(x=factor(Nutrient),y = inter_val+inter_upCI + 10,label=sig,group=fct_rev(Followup)),position = position_dodge(width=1)) + 
  scale_fill_brewer(palette = "Set1")
  
