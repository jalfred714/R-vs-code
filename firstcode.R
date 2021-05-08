library("tidyverse", help, pos = 2, lib.loc = NULL)
library("tidyquant", help, pos = 2, lib.loc = NULL)
library("ggplot2", help, pos = 2, lib.loc = NULL)
library("plotly", help, pos = 2, lib.loc = NULL)

p_adj<- c("FB", "JNJ","GOOG","AAPL","^GSPC") %>%
  tq_get(  from = '2019-01-31',
           to = '2019-12-30',
           get = 'stock.prices') %>%
  group_by(symbol) %>%
  tq_transmute(select = adjusted,
               mutate_fun = to.period,
               period= "days", ) 

p5<-p_adj %>% group_by(symbol) %>% 
  filter( symbol %in% c("FB", "JNJ","AAPL") )%>% 
  ggplot(aes(x=date,y= adjusted, color= symbol)) + 
  geom_line() + 
  labs(title=" Adjusted Stock Prices: Facebook , \n Johnson & Johnson, Apple", x="Time", y= "Adjusted ") +
  geom_smooth(method = "lm" )



p6<-p_adj %>% group_by(symbol) %>% 
  filter( symbol %in% c("GOOG","^GSPC" ) )%>% 
  ggplot(aes(x=date,y= adjusted, color= symbol)) + 
  geom_line() + 
  labs(title=" Adjusted Stock Prices: Google vs S&P500", x="Time", y= "Adjusted ") +
  geom_smooth(method = "lm" )

