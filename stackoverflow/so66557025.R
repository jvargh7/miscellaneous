dat = read.table(text='num  Name1   Result1 Name2  Result2   Name3  Result3
1    75%      74      100%    101      50%   50
2    75%      73      100%    101      50%   49
3    50%      50      100%    105      125%  128',header=TRUE)


dat %>% 
  rename_at(vars(matches("[0-9]")),
            ~str_replace(.,"(\\d)(\\w*)","\\2_\\1")) %>% 
  pivot_longer(cols=matches("_"),names_to=c(".value","group"),
               names_sep="_") %>% 
  dplyr::select(-group) %>% 
  pivot_wider(names_from = "Name",values_from="Result")


reshape(dat, idvar="num", direction="long", 
        varying=list(Name=c(2,4,6), Result=c(3,5,7)),
        v.names = c("Name", "Result") ) %>% 
  dplyr::select(-time) %>% 
  dcast(num ~ Name)
  # reshape(.,direction="wide",idvar = "num",timevar = "Name")
