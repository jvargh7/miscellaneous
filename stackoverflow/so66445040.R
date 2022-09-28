df = data.frame(V1= c("Lebel, MarieStudent 1st year216 132-3789",
      "Lachance, PaulTeacher 2nd year567 990-345 ext 1811",
      "Smith, AnnieStudent 1st yearNot available"))


df %>% 
  separate(V1,into=c("name","step1"),sep=",") %>% 
  mutate(title = case_when(str_detect(step1,pattern = "Student") ~ "Student",
                           str_detect(step1,pattern = "Teacher") ~ "Teacher",
                           TRUE ~ NA_character_
                           )) %>% 
  mutate(step2 = str_replace(step1,title,replacement = "")) %>% 
  separate(step2,into=c("surname","step3"),"[0-9]+(st|nd|rd|th)+",remove = FALSE) %>% 
  mutate(step3 = str_replace(step2,surname,"")) %>% 
  mutate(year = str_extract(step3,"[0-9](st|nd|rd|th) year")) %>% 
  mutate(step4 = str_replace(step3,year,"")) %>% 
  mutate(area_code = str_extract(step4,"[0-9]+\\s")) %>% 
  mutate(phone_number = str_replace(step4,area_code,"")) %>% 
  dplyr::select(-step1,-step2,-step3,-step4)
