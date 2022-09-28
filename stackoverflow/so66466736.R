df <- data.frame(A = rep(LETTERS[seq( from = 24, to = 26 )], 26*5),
                 B = rnorm(26*15))
df <- df %>% mutate(C = ifelse(A == 'Z', B*7, 
                               ifelse(A == 'Y', B + 7, B)))

# plot using facet_wrap
pwrap <- ggplot(df, aes(y = C)) +
  geom_boxplot() +
  theme_classic() +
  facet_wrap(facets = 'A')
# ggplot object shows fine
pwrap

library(plotly)

# plot using facet_grid
pgrid <- ggplot(df, aes(y = C)) +
  geom_boxplot() +
  theme_classic() +
  facet_grid(.~A)
# again, ggplot object shows fine
pgrid
# but ggplotly object is limited to first facet
ggplotly(pgrid)

# my goal: facet_wrap to allow 'free' y-scales for variable C, with ggplotly hover info
ggplot(df, aes(y = C)) +
  geom_boxplot() +
  theme_classic() +
  facet_wrap(~A, scales = 'free')