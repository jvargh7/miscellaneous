data_ts <- data.frame(sales_year = c("2015-01-01", "2015-01-01", "2015-01-01", "2016-01-01",
                                     "2016-01-01", "2016-01-01", "2017-01-01", "2017-01-01", "2017-01-01", "2018-01-01", "2018-01-01",
                                     "2018-01-01", "2019-01-01", "2019-01-01", "2019-01-01"), product = c("a", "b", "c", "a", "b", "c",
                                                                                                          "a", "b", "c", "a", "b", "c", "a", "b", "c"), sales = c(6, 11, 13, 6, 2, 6, 11, 12, 10,  4, 12, 2,
                                                                                                                                                                  17, 6, 8))
library(tsibble)
library(fable)

# A bit of pre-processing
library(lubridate)
data_ts <- data_ts %>% 
  mutate(sales_year = ymd(sales_year)) %>% 
  mutate(sales_year = year(sales_year))

data_ts <- tsibble(data_ts, index = sales_year, key = product)

data_train <- data_ts %>%
  dplyr::filter(sales_year < "2018-01-01")

data_ses <- data_train %>%
  model(ETS(sales ~ error("A") + trend("N") + season("N")))
data_ses_fc <- data_ses %>%
  forecast(h = 1)

data_accuracy <- data_ses_fc %>%
  accuracy(data_ts) %>% 
  mutate(res = paste0("RMSE: ",round(RMSE,2),"\n",
                      "MAE: ",round(MAE,2)))

data_ses_fc %>%
  autoplot(data_ts) +
  geom_line(aes(y = .fitted), col="red",
            data = augment(data_ses)) +
  geom_text(data=data_accuracy,aes(x = 2016,y=12,group=product,label=res))
