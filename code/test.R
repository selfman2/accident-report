# import data.frame
sessionInfo()
Sys.setlocale(category="LC_ALL", locale="de_DE")
Sys.setlocale(category="LC_NUMERIC", locale="de_DE")
### kind of workaround for messed up , and . delimiter of numbers
### . in germany is used as 1000-delimiter, whereas , is used as decimal-delimiter
###
### as the original data-cells were like this:     '187.118
### I decided to change the figures by hand, i.e. eliminating the ' and the .
### ... otherwise the above mentioned approach should work fine.

library(xlsx)
my_cc<-c("character",rep("integer", 19))
my_data <- read.xlsx("data/adac-unfallgeschehen.xlsx", "Page 13", startRow = 2, header = T, colIndex=c(1,2,3,4,5,6,7), colClasses = my_cc)

my_data$Year<-as.Date(my_data$Year,origin=0)
my_data$Year<-as.character(my_data$Year)
#my_data_ts<-as.ts(my_data)

library(forecast)
mfit<-auto.arima(my_data$F.less18)
fcast<-forecast(mfit, h=5)
#fcast
plot(fcast, main = "Number of Road Accidents in Germany", ylab = "Total # of Males", xlab = "Year", xaxt="n", plot.conf="FALSE")
my_years<-as.integer(my_data$Year)
axis(1,at=1:16,label=my_years,las=2)
#axis(2,at=1:25,label=seq(1,500000,20000))
grid()
