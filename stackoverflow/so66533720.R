library(lme4)

model0 <- lmer(Reaction ~ (1 + Days|Subject),data=sleepstudy)
ranef_model0 <- ranef(lmer(Reaction ~ (1 + Days|Subject),data=sleepstudy)) %>% data.frame()

ggplot(sleepstudy)+
  geom_smooth(aes(x=Days, y=Reaction, group=Subject), method=lm, se=F)
