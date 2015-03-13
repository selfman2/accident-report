
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Injured/Dead Persons (per year) due to Road Accidents in Germany"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("This app allows the user to visualize some aspects of the above mentioned scenario/data.", 
                "One special option is to predict into the future, if wished.",
                "Data source: ADAC Germany"), 
      selectInput("agegroup", label = ("Pls select age group for display:"), 
                   choices = list("under 18" = 1, "aged 18 to 21" = 2,
                                  "all ages" = 3), selected = 2),
      radioButtons("gender", label = ("Pls select male or female victims for display"),
                   choices = list("Male" = 1, "Female" = 2), selected = 1),
      checkboxInput("prediction", label = "Do you want 5-year prediction (instead of only 1 year)?", value = FALSE),
      submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("gender"),
      textOutput("agegroup"),
      textOutput("prediction"),
      plotOutput("predPlot")
    )
  )
))
