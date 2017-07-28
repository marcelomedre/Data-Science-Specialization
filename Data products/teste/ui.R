#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Pressão aplicada linha R1 Rubi"),
  sidebarLayout(
    sidebarPanel(
      numericInput("lambda", "Comprimento de onda de excitação (em nm):",
                   value = 100000, min = 1, max = 100000, step = 0.01),
      numericInput("rubi", "Valor (em cm-1) da linha R1 de emissão do Rubi:",
                   value = 100000, min = 1, max = 100000, step = 0.01),
      numericInput("temp", "Temperatura (em ºC):",
                   value = 100000, min = 1, max = 100000, step = 0.1)
    ),
    mainPanel(
      h3("Pressão em GPa:"),
      textOutput("PGPa"),
      h3("Pressão em kbar:"),
      textOutput("pred2")
    )
  )
))

