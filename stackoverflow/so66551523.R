library(mice)
imp <- mice(nhanes)

imp <- map(1:imp$m)
