dat = read.table(text='Age, ID, Delta
24m, 4013, 0.8869
36m, 4013, 0.4119
24m, 4016, 0.2184
36m, 4016, 0.4149
24m, 4093, 0.7625
36m, 4093, 0.5281',header=TRUE,sep=",")

dat %>% 
  pivot_wider(names_from = "Age",values_from="Delta",names_prefix = "Delta_")
