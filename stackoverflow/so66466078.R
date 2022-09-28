firm <- c("firm1","firm2","firm3","firm4")
comment2 <- c(51,5104,"",510466)
commenta <- c(51,51,"",51)
commentb <- c("",04,"",04)
commentc <- c("","","",66)

list <- data.frame(firm,comment2,commenta,commentb,commentc)

commentcode  <- c(51,04,66,67)
narrcmnt <- c("less business", "more business", "unemployment", "covid")

comment <- data.frame(commentcode,narrcmnt)


list %>% 
  left_join(comment %>% 
              mutate(commentcode = as.character(commentcode)),
            by=c("commenta" = "commentcode")) %>% 
  mutate(narrcmnt = case_when(is.na(narrcmnt) ~ "",
                              TRUE ~ as.character(narrcmnt)))
