Probability <- c(1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0)
Score2 <- c(2,3,4,2,3,4,2,3,4,4,3,2,3,2,3,2,3,2,3,4,2,3,4,2,3,3,4,3,2,3,2,3,2,3)
Data2 <- data.frame(Probability, Score2)

library(ggpubr)

mean_x = mean(Score2)
sd_x = sd(Score2)

# Linear Probability Model
lm_prob <- lm(Probability ~ Score2,data=Data2)

pred_probs = predict(lm_prob,newdata = data.frame(Score2 = c(mean_x - sd_x, mean_x+sd_x)))
or_pred = (pred_probs[2]/(1-pred_probs[2]))/(pred_probs[1]/(1-pred_probs[1]))

# Logistic Regression

glm_prob <- glm(Probability ~ Score2,data=Data2,family=binomial())

glm_pred_probs = predict(glm_prob,newdata = data.frame(Score2 = c(mean_x - sd_x, mean_x+sd_x)),type = "response",se.fit = TRUE)
glm_or_pred = (glm_pred_probs$fit[2]/(1-glm_pred_probs$fit[2]))/(glm_pred_probs$fit[1]/(1-glm_pred_probs$fit[1]))

library(contrast)
glm_contrast <- 
  contrast(glm_prob, 
           list(Score2 = sd_x),
           list(Score2 = -sd_x)
  )
print(glm_contrast, X = TRUE)

or_ci = paste0(round(exp(glm_contrast$Contrast),2), 
               ", 95% CI:",
               round(exp(glm_contrast$Lower),2),
               ", ",
               round(exp(glm_contrast$Upper),2),
               ", p = ",
               round(glm_contrast$Pvalue,3)
               )


ggplot(Data2, aes(Score2, Probability))+ 
  geom_smooth(method='lm', alpha = .3, color = "black")+
  stat_cor(method = "pearson", label.x.npc = "left", label.y.npc= "top", label.sep = "
")+
  annotate("text", x=3.0, y=0.9, label= paste0("OR = ",or_ci)) +
  scale_colour_grey(start = .6, end = .2)+
  scale_fill_grey(start = 0.6, end = 1)+
  theme_classic()+
  scale_y_continuous(breaks = c(0,0.25,0.5,0.75,1), limits = c(0, 1))


