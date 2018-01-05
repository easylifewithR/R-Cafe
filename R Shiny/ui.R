library(shiny)

shinyUI(fluidPage(

))




sidebarLayout(
  sidebarPanel(
    
  ),
  mainPanel(
    
  )
)

selectInput(inputId = "temperature",
            label = "Temperature:",
            choices = c(32, 33, 34, 35, 36, 37, 38, 39, 40),
            selected = 36)

sidebarLayout(
  sidebarPanel(
    selectInput("temperature",
                "Temperature:",
                choices = c(32, 33, 34, 35, 36, 37, 38, 39, 40),
                selected = 36),
    numericInput("HR",
                 "Heart Rate:",
                 min = 30,
                 max = 150,
                 value = 90),
    numericInput("RR",
                 "Respiratory Rate",
                 min = 10,
                 max = 35,
                 value = 20),
    sliderInput("WBC",
                "White Blood Cell (10^3 mm^3)",
                min = 1,
                max = 20,
                value = 6)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    textOutput("temperature"),
    textOutput("HR"),
    textOutput("RR"),
    textOutput("WBC")
  )
)