### helpers.R function

pred_plot <- function(v_gender, v_agegroup, v_prediction) {
   my_dataset <-paste0("my_data$",v_gender,v_agegroup)
   my_pred_interval<-1
   if (v_prediction == T) {
      my_pred_interval = 5
   }
   #print(my_dataset) #gives:  "my_data$M.less18"   
   
   mfit<-auto.arima(my_data$M.less18) #mfit<-auto.arima(my_dataset) does not work :-(
   fcast<-forecast(mfit, h=my_pred_interval)  #this one works fine!!!
   plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total #", xlab = "Year", xaxt="n", plot.conf="FALSE")
   my_years<-as.integer(my_data$Year)
   axis(1,at=1:16,label=my_years,las=2)
   grid()
}
