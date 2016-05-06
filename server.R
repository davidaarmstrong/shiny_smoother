library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  load("voicerep.rda")
  output$plot <- renderPlot({
    lo <- loess(voicerep$rep1 ~ voicerep$voice, span=input$span, degree=input$degree, 
        family=ifelse(input$family==1, "gaussian", "symmetric"))
    plot(rep1 ~ voice, data=voicerep, main = paste("RSS = ", 
        round(sum(lo$residuals^2), 3), "\nEDF = ", 
        round(lo$trace.hat, 3), sep=""), xlab="Repression", ylab="Democracy")
    lines(sort(lo$x), lo$fitted[order(lo$x)], 
        type="l", col="red", lwd=2)
  }, width=650, height=650)
})