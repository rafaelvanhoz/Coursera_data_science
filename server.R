library(shiny)
library(HistData)
library(dplyr)
library(ggplot2)

#selecting the data
data(GaltonFamilies)

# 1st step: Pass inches to cm
gf <- GaltonFamilies
gf <- gf %>% mutate(father=father*2.54,
                    mother=mother*2.54,
                    childHeight=childHeight*2.54)

# linear model
model1 <- lm(childHeight ~ father + mother + gender, data=gf)

shinyServer(function(input, output) {
    output$pText <- renderText({
        paste("Father's height is",
              strong(round(input$father, 1)),
              "cm, and mother's height is",
              strong(round(input$father, 1)),
              "cm, then:")
    })
    output$pred <- renderText({
        df <- data.frame(father=input$father,
                         mother=input$mother,
                         gender=factor(input$gender, levels=levels(gf$gender)))
        ch <- predict(model1, newdata=df)
        kid <- ifelse(
            input$gender=="female",
            "Daugther",
            "Son"
        )
        paste0(em(strong(kid)),
               "'s predicted height is going to be around ",
               em(strong(round(ch))),
               " cm"
        )
    })
    output$Plot <- renderPlot({
        kid <- ifelse(
            input$gender=="female",
            "Daugther",
            "Son"
        )
        df <- data.frame(father=input$father,
                         mother=input$mother,
                         gender=factor(input$gender, levels=levels(gf$gender)))
        ch <- predict(model1, newdata=df)
        yvals <- c("Father", kid, "Mother")
        df <- data.frame(
            x = factor(yvals, levels = yvals, ordered = TRUE),
            y = c(input$father, ch, input$mother))
        ggplot(df, aes(x=x, y=y, color=c("Grey", "green", "black"), fill=c("Grey", "green", "black"))) +
            geom_bar(stat="identity", width=0.5) +
            xlab("") +
            ylab("Height (cm)") +
            theme_minimal() +
            theme(legend.position="none")
    })
})
