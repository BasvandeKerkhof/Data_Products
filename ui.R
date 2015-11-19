library(shiny)
library(ggplot2)




shinyUI(
    pageWithSidebar(
        headerPanel("Very simple linear model"),
        
        
        sidebarPanel(
            
            h3('Which variables to use'),
            selectInput('x', 'Predictor', choices = names(mtcars), selected = "mpg"),
            selectInput('y', 'Dependent variable', choices = names(mtcars), selected = "cyl"),
            
            h3('Linear model'),
            checkboxInput('line', 'Check this box if you want to plot the best linear fit'),
            
            
            h3('Description of variables:'),
            
            
            tags$ul(
                tags$li("mpg: Miles/(US) gallon"),
                tags$li("cyl: Number of cylinders"),
                tags$li("disp: Displacement (cu.in.)"),
                tags$li("hp: Gross horsepower"),
                tags$li("drat: Rear axle ratio"),
                tags$li("wt: Weight (lb/1000)"),
                tags$li("qsec: 1/4 mile time"),
                tags$li("vs: V or straight engine"),
                tags$li("am: Transmission (0 = automatic, 1 = manual)"),
                tags$li("gear: Number of forward gears"),
                tags$li("carb: Number of carburetors")
            )
            
            
            
        ),
        
        mainPanel(
            p('This very simple Shiny application is made for the course 
               project of the Developing Data products Coursera course. 
               The intention of this application is to show some basic Shiny 
               skills.'),            
            p('With this application we can plot two variables from the 
              mtcars dataset. These values can be chosen from the drop down 
              lists on the left. The correlation between these variables is 
              calculated and a plot is drawn. By checking the box a linear fit 
              for the chosen variables is plotted.'),
            
            p('As predictor you chose:'),
            verbatimTextOutput("x"),
            p('As dependent variable you chose:'),
            verbatimTextOutput("y"),
            
            p('These variables have a correlation of:'),
            verbatimTextOutput("cor"),
            
            h4('Plot of dependent variable vs predictor'),
            
            plotOutput('plot')
            
        )
    )
)