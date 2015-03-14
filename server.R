
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

library(xlsx)
library(forecast)

#source("helpers.R")

my_cc<-c("character",rep("integer", 19))
my_data <- read.xlsx("data/adac-unfallgeschehen.xlsx", "Page 13", startRow = 2, header = T, colIndex=c(1,2,3,4,5,6,7), colClasses = my_cc)
my_data$Year<-as.character(my_data$Year)


shinyServer(function(input, output) {
   
   output$predPlot<-renderPlot({
     
      if (input$gender == 1 && input$agegroup == 1 && input$prediction == FALSE) {
         mfit<-auto.arima((my_data$M.less18)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=1)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Male < 18ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      }
      if (input$gender == 1 && input$agegroup == 1 && input$prediction == TRUE) {
         mfit<-auto.arima((my_data$M.less18)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=5)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Male < 18ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      } 

      if (input$gender == 1 && input$agegroup == 2 && input$prediction == FALSE) {
         mfit<-auto.arima((my_data$M.from18to21)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=1)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Male from 18 to 21 ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      }
      if (input$gender == 1 && input$agegroup == 2 && input$prediction == TRUE) {
         mfit<-auto.arima((my_data$M.from18to21)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=5)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Male from 18 to 21 ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      } 
      
      if (input$gender == 1 && input$agegroup == 3 && input$prediction == FALSE) {
         mfit<-auto.arima((my_data$M.all)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=1)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Male (all)", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      }
      if (input$gender == 1 && input$agegroup == 3 && input$prediction == TRUE) {
         mfit<-auto.arima((my_data$M.all)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=5)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Male (all)", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      } 
      
      
      
      if (input$gender == 2 && input$agegroup == 1 && input$prediction == FALSE) {
         mfit<-auto.arima((my_data$F.less18)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=1)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Female < 18ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      }
      if (input$gender == 2 && input$agegroup == 1 && input$prediction == TRUE) {
         mfit<-auto.arima((my_data$F.less18)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=5)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Female < 18ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      } 
      
      if (input$gender == 2 && input$agegroup == 2 && input$prediction == FALSE) {
         mfit<-auto.arima((my_data$F.from18to21)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=1)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Female from 18 to 21 ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      }
      if (input$gender == 2 && input$agegroup == 2 && input$prediction == TRUE) {
         mfit<-auto.arima((my_data$F.from18to21)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=5)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Female from 18 to 21 ys", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      } 
      
      if (input$gender == 2 && input$agegroup == 3 && input$prediction == FALSE) {
         mfit<-auto.arima((my_data$F.all)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=1)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Female (all)", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      }
      if (input$gender == 2 && input$agegroup == 3 && input$prediction == TRUE) {
         mfit<-auto.arima((my_data$F.all)) #mfit<-auto.arima(my_dataset) does not work :-(
         fcast<-forecast(mfit, h=5)  #this one works fine!!!
         plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total # Female (all)", xlab = "Year", xaxt="n", plot.conf="FALSE")
         my_years<-as.integer(my_data$Year)
         axis(1,at=1:16,label=my_years,las=2)
         grid()
      } 
      
      
            
   }) 

})
