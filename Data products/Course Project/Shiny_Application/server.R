#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$table <- renderDataTable({
          data <- transmute(mtcars, Car = rownames(mtcars), KmperLGasoline = mpg*1.6/3.78541,
                            KmperLEthanol = KmperLGasoline/1.3,
                            GasConsumed = input$km/KmperLGasoline,
                            EthanolConsumed = input$km/KmperLEthanol,
                            TotalExpendGasoline = GasConsumed*input$price,
                            TotalExpendEthanol = EthanolConsumed*input$Eta)
          if(input$price >= input$Eta){
                  data <- arrange(data, TotalExpendEthanol)
                  data
          }else {
                  data <- arrange(data, TotalExpendGasoline)
                  data
          }

          
  }, options = list(lengthMenu = c(5,10), pageLength = 10))
  
})
