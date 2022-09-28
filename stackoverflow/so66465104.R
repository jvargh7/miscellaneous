mydf<-data.frame(ID=c('a','b','c','d','e'),
                 home=c(0,2,1,0,0),
                 aroundtown=c(0,3,0,1,2),
                 outinspace=c(5,0,0,2,1))

# https://stackoverflow.com/questions/66465104/is-there-a-best-practice-in-producing-a-series-of-columns-filled-with-values-bas

md2<-mydf%>%
  pivot_longer(cols=-ID)%>%
  group_by(ID)%>%
  mutate(tot=sum(value))%>%
  mutate(Exclusive=ifelse(value==tot,"Exclusive",""))%>%
  mutate(freq=ifelse(Exclusive=="",1,2))%>%
  select(-Exclusive)%>%
  uncount(freq)%>%
  group_by(ID,name)%>%
  mutate(exclusive=ifelse(cumsum(value)>value,"exclusive","Any"))%>%
  select(-tot)%>%
  pivot_wider(names_from = c(name,exclusive),values_from = value)%>%
  replace(is.na(.),0)


mydf
