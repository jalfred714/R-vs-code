library("tidyverse", help, pos = 2, lib.loc = NULL)
library("tidyquant", help, pos = 2, lib.loc = NULL)
library("ggplot2", help, pos = 2, lib.loc = NULL)
library("plotly", help, pos = 2, lib.loc = NULL)
library("readxl", help, pos = 2, lib.loc = NULL)
library("dplyr", help, pos = 2, lib.loc = NULL)

st<- as.Date("2007/01/01")
end<- as.Date("2020-06-30")

tiempo<- seq(st, end,"quarter")

datos<- read_excel("datos_trimestrales_adlr1.xlsx")

glimpse(datos)

# geom line no deberia pedir los aes, ya que estan puestos en el ggplot. 
p1<- datos %>% ggplot(, aes(x = tiempo, y = pib.x12, color= Recau.x12 )) + geom_line(aes(x = tiempo, y = pib.x12))

ggplotly(p1)

