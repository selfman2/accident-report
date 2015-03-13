
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

library(xlsx)
library(forecast)

source("helpers.R")

my_cc<-c("character",rep("integer", 19))
my_data <- read.xlsx("data/adac-unfallgeschehen.xlsx", "Page 13", startRow = 2, header = T, colIndex=c(1,2,3,4,5,6,7), colClasses = my_cc)
my_data$Year<-as.character(my_data$Year)


shinyServer(function(input, output) {
   
   output$predPlot<-renderPlot({
     
      v_gender <- switch(input$gender, 
                     "Male" = M.,
                     "Female" = F.)
      v_agegroup <- switch(input$agegroup,
                         "under 18" = less18,
                         "aged 18 to 21" = from18to21,
                         "all ages" = all)
      v_prediction <- switch(input$prediction,
                           "TRUE" = T,
                           "FALSE" = F)
      
      pred_plot(v_gender, v_agegroup, v_prediction)
      
   }) 

})
