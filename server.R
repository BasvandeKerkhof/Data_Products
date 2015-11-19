
library(shiny)
library(ggplot2)

shinyServer(
    function(input, output) {
        
        output$plot <- renderPlot({
            plot <- ggplot(data = mtcars, aes_string(x = input$x, y = input$y)) +
                geom_point()
            if(input$line){
                plot <- plot + geom_smooth(method="lm")}
            print(plot)})
        
        output$x <- renderText({input$x})
        output$y <- renderText({input$y})
        
        corr <- reactive({cor(mtcars[,input$x], mtcars[,input$y])})
        
        output$cor <- renderText({corr()})


    }
)