### helpers.R function

pred_plot <- function(v_subgroup, v_prediction) {
   #my_dataset<-"my_data$" %+% v_gender %+% v_agegroup
   #my_dataset <-paste("my_data$",v_gender,v_agegroup, sep="", collapse=NULL)
   my_pred_interval<-1
   #if (v_prediction == T) {
   #   my_pred_interval = 5
   #}
   print(v_subgroup)
   #print(my_dataset) #gives:  "my_data$M.less18"   
   #str(my_dataset)
   #class(my_dataset)
   mfit<-auto.arima((v_subgroup)) #mfit<-auto.arima(my_dataset) does not work :-(
   fcast<-forecast(mfit, h=my_pred_interval)  #this one works fine!!!
   plot(fcast, main = "Number of Victims in German Road Accidents", ylab = "Total #", xlab = "Year", xaxt="n", plot.conf="FALSE")
   my_years<-as.integer(my_data$Year)
   axis(1,at=1:16,label=my_years,las=2)
   grid()
}
