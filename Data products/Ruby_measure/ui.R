library(shiny)

shinyUI(fluidPage(
  titlePanel("Calculadora Pressao - R1 Rubi"),
  sidebarLayout(
    sidebarPanel(
      numericInput("lambda", "Comprimento de onda de excitacao (em nm):",
                   value = 632.8, min = 1, max = 100000, step = 0.01),
      numericInput("rubiref", "Valor (em cm-1) da linha R1 de emissao do Rubi (referencia):",
                   value = 1398.54, min = 1, max = 100000, step = 0.01),
      numericInput("rubi", "Valor (em cm-1) da linha R1 de emissao do Rubi:",
                   value = 1398.54, min = 1, max = 100000, step = 0.01),
      numericInput("temp", "Temperatura (em C):",
                   value = 22.8, min = 1, max = 300, step = 0.1)
    ),
    mainPanel(
      h3("Pressao em GPa:"),
      textOutput("PGPa"),
      h6(""),
      h6("Dewaele A., Torrent M., Loubeyre P. and Mezouar M. (2008) Phys. Rev. B 78, 104102"),
      h6("Mao H.K., Xu J., and Bell P.M. (1986) J. Geophys. Res. 91, 4673."),
      h6("correcao de temperatura dada por:"),
      h6("Deirdre D. Ragan, Fi. Gustavsen, and David Schiferl, Journal of Applied Physics 72, 5539 (1992)"),
      h3("Pressao em GPa: (Quase-Hidrostatica)"),
      textOutput("PGPaMao"),
      h6("Pressao calculada utilizando a eq. de Mao sem correcao de Temperatura"),
      h6("para uma condicao hidrostatica. Mao H.K., Xu J., Bell P.M. (1986) J. Geophys. Res. 91, 4673 ")

    )
  )
))
