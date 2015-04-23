library(shiny)
library(ggplot2)

shinyServer(
    function(input, output) {
    # This part generates the distribution plot based on the user input for mu and color
        output$newHist <- renderPlot({
            x <<- rnorm(10000,0,10)
            y <<- rnorm(1000,input$Mu1,4)
            z <<- c(x,y)
            set.seed(100)
            qplot(z, geom="histogram", binwidth = 2, colour = I("black"), fill = I(input$id1), xlab = "Sample Value") +
                coord_cartesian(xlim = c(-50,60)) +
                ylim(0,1000) 
                        })
                    }
)