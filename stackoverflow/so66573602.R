library(ggpubr)

# Create data frame
GROUP <- c()
TEST <- c()
VALUE <- c()
for (i in 0:100) {
  gp <- c('Group1','Group2','Group1 and Group2')
  ts <- c('Test1','Test2') 
  GROUP <- append(GROUP, sample(gp, 1))
  TEST <- append(TEST, sample(ts, 1))
  VALUE <-  append(VALUE, sample(1:200, 1))
}
df <- data.frame(GROUP, TEST, VALUE)

# Seed
set.seed(123)

# Plot
ggerrorplot(df, x = "GROUP", y = "VALUE",
            desc_stat = "mean_sd",
            add = c("jitter"),
            color = "TEST",
            # color = "TEST",
            palette = "jco",
            add.params = list(size = 0.2),
            order = c('Group1','Group2','Group1 and Group2')
) +
  labs(x = '', y = 'Values\n') +
  theme(legend.title = element_blank()) +
  geom_jitter(col="black") +
  scale_color_manual(values=c("Test1" = "red","Test2" = "blue"))
