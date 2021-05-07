#
# Shiny App and Reproducible Pitch
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Week 4 - Shiny app"),
    titlePanel(h3( "By Rafael Vanhoz")),
    sidebarLayout(position = "left",
        sidebarPanel(
            helpText("Prediction of the child's height based on gender and parent's height"),
            helpText("Parameters to choose:"),
            sliderInput(inputId = "father",
                        label = "Father's height (cm):",
                        value = 150,
                        min = 150,
                        max = 220,
                        step = 1),
            sliderInput(inputId = "mother",
                        label = "Mother's height (cm):",
                        value = 140,
                        min = 140,
                        max = 200,
                        step = 1),
            radioButtons(inputId = "gender",
                         label = "Child's gender: ",
                         choices = c("Female"="female", "Male"="male"),
                         inline = TRUE)
        ),
        
        mainPanel(
            wellPanel(h1("Height Pediction")),
            htmlOutput("pText"),
            htmlOutput("pred"),
            plotOutput("Plot", width = "50%")
        )
    )
))
