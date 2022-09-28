dat = read.table(text='person_id|custody_start|custody_end|contact_month|month_start     |month_end |contact_date
    13126321 |02/23/2020   |07/17/2020 |February 20  |02/01/2020      |02/28/2020|26/02/2020    
    13126321 |02/23/2020   |07/17/2020 |March 20     |03/01/2020      |03/31/2020|12/03/2020    
    13126321 |02/23/2020   |07/17/2020 |April 20     |04/01/2020      |04/30/2020|11/04/2020  
    13126321 |02/23/2020   |07/17/2020 |May 20       |05/01/2020      |05/31/2020|12/05/2020 
    13126321 |02/23/2020   |07/17/2020 |June 20      |06/01/2020      |06/30/2020|11/06/2020  
    13126321 |02/23/2020   |07/17/2020 |July 20      |07/01/2020      |07/31/2020|12/07/2020',sep="|",header = TRUE)


library(lubridate)
dat %>% 
  mutate_at(vars(contains("custody"),contains("month_")),
            function(x) as.character(x) %>% mdy(.)) %>% 
  mutate(contact_date = dmy(as.character(contact_date))) %>% 
  dplyr::filter(month_start >= custody_start & month_end <= custody_end)
  

