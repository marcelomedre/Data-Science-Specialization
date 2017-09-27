#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Ethanol x Gasoline"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            helpText("Give your trip details and I will tell if it's more economic gasoline or Ethanol:"),
            numericInput("km", "Distance (in km):", 50, min = 1, max = 3000),
            numericInput("price", "Gasoline Price (R$ per liter):", 3.69, min = 2.0, max = 5.00, step = 0.01),
            numericInput("Eta", "Ethanol Price (R$ per liter):", 2.69, min = 2.0, max = 5.00, step = 0.01)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
            h3("If Ethanol's price is <= 70% of the Gasoline's, Ethanol would be more convenient, making your trip more cheap."),
            dataTableOutput("table")
    )
  )
))
