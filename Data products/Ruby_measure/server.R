library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  PGPa <- reactive({
    c1 <- 7.665
    c2 <- 0.365
    c3 <- 0.00739
    c4 <- 0.0000026
    c5 <- 0.0000000083
    rubiref <- input$rubiref
    Tref <- 22.8
    lambda <- input$lambda
    temp <- input$temp
    rubi <- input$rubi
    # Comprimento de onda de nm para cm-1
    lambdacm <- (1/lambda)*1.0e7
    rubinm <- (1/(lambdacm - rubi))*1.0e7
    lambda0 <- (1/(lambdacm - rubiref))*1.0e7
    PGPa <- (lambda0/c1/c2)*(((rubinm - c3*(temp - Tref) +
                                 c4*(temp - Tref)^2 - 
                                 c5*(temp - Tref)^3)/lambda0)^c1 - 1)
  })
  PGPaMao <- reactive({
    a <- 1904 # GPa
    b <- 9.61
    rubiref <- input$rubiref
    rubi <- input$rubi
    lambda <- input$lambda
    lambdacm <- (1/lambda)*1.0e7
    rubinm <- (1/(lambdacm - rubi))*1.0e7
    lambda0 <- (1/(lambdacm - rubiref))*1.0e7
    
    PGPaMao <- a/b*((rubinm/lambda0)^b - 1)
      
  })
  
  output$PGPa <- renderText({
    PGPa()
  })
  
  output$PGPaMao <- renderText({
    PGPaMao()
  })
})
    
    

