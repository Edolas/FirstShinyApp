library(shiny)
library(ggplot2)
shinyUI(pageWithSidebar(
    headerPanel("Histogram Shoulder Peak Generator"),
    sidebarPanel(
        sliderInput('Mu1', 'Set shoulder mean (mu)',value = 25, min = 0, max = 40, step = 5,),
        radioButtons("id1", "Graph color",
                           list("Grey"= "grey",
                                "Red" = "red",
                                "Green" = "green",
                                "Blue" = "blue",
                                "White"= "white"))
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Introduction",
                     br(),
                     p("In the Plot tab this generator will display a histogram of two normal distributions added together.
                       There is a large fixed distribution and a smaller variable one."),
                     p("The larger distribution can be thought of as sample values from a standard population 
                        and the smaller distribution as a group of responders. When the distributions have identical 
                        mu values (0) 
                        the result is a single distribution. However by using the slider the user can change the mu
                        of the responder group and thus generate a larger or smaller deviation from the standard 
                        population group."),
                     p("As the responder population distribution is seperated further from the standard population 
                       a 'shoulder peak' appears in the histogram. This behaviour illustrates how difficult it can 
                       be to isolate the effect of a small group of responders from the standard population
                        when the effect generated only a small change in mu."),
                     br(),
                     p("-- Enjoy! --"),
                     br(),
                     p("Notes"),
                     p("The color of the graph can be changed with the radiobutton."),
                     p("The values for the standard population distribution are 10.000 rnorm and 10 sd"),
                     p("The values for the responder distribution are 1.000 rnorm and 4 sd")                     
                     ),
            tabPanel("Plot", plotOutput("newHist"))
        )
    )
))
