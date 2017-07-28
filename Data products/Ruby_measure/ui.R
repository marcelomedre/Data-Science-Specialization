library(shiny)

shinyUI(fluidPage(
  titlePanel("Pressao aplicada linha R1 Rubi"),
  sidebarLayout(
    sidebarPanel(
      numericInput("lambda", "Comprimento de onda de excitacao (em nm):",
                   value = 632.8, min = 1, max = 100000, step = 0.01),
      numericInput("rubi", "Valor (em cm-1) da linha R1 de emissao do Rubi:",
                   value = 1400, min = 1, max = 100000, step = 0.01),
      numericInput("temp", "Temperatura (em C):",
                   value = 23, min = 1, max = 300, step = 0.1)
    ),
    mainPanel(
      h3("Pressao em GPa:"),
      textOutput("PGPa")

    )
  )
))
