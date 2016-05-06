shinyUI(fluidPage(
  titlePanel(h1("Smoother Paramters")),
  sidebarLayout(
    sidebarPanel(
        sliderInput("span", label = h3("Smoother Bandwidth"),
        min = 0, max = 1, value = .25),
        selectInput("degree", label = h3("Polynomial Degree"), 
        choices = list("0" = 0, "1" = 1,
                       "2" = 2), selected = 3),
        selectInput("family", label = h3("Family"), 
        choices = list("Gaussian" = 1, "Symmetric" = 2, selected = 1)
       )) ,
    mainPanel(plotOutput("plot", width="100%"))
)))               
