#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(colourpicker)
library(shiny)
library(shinydashboard)


fluidPage(
    
    # App title ----
    titlePanel("Spikey Boi"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Random seed
            numericInput(inputId = "seed",
                         label = "Seed",
                         value = 123),
            
            # Left input
            sliderInput(inputId = "leftNoise",
                        label = "Left Side Noise!",
                        min = 0,
                        max = 3,
                        value = 0,
                        step = 0.1),
            sliderInput(inputId = "leftStart",
                        label = "Start left side triangles",
                        min = 0,
                        max = 50,
                        value = 40),
            sliderInput(inputId = "leftXDistance",
                        label = "Left Side x-distance between rows",
                        min = 1,
                        max = 50,
                        value = 5),
            sliderInput(inputId = "leftHeight",
                        label = "Left Triangle Height",
                        min = 1,
                        max = 10,
                        value = 5),
            sliderInput(inputId = "leftWidth",
                        label = "Left Triangle Width",
                        min = 1,
                        max = 10,
                        value = 5),
            colourInput(inputId = "leftColor",
                        label = "Left Side Color",
                        value = "purple"),
            
            
            # Right input
            sliderInput(inputId = "rightNoise",
                        label = "Right Side Noise!",
                        min = 0,
                        max = 3,
                        value = 0,
                        step = 0.1),
            sliderInput(inputId = "rightStart",
                        label = "Start right side triangles",
                        min = 50,
                        max = 100,
                        value = 60),
            sliderInput(inputId = "rightXDistance",
                        label = "Right Side x-distance between rows",
                        min = 1,
                        max = 50,
                        value = 5),
            sliderInput(inputId = "rightHeight",
                        label = "Right Triangle Height",
                        min = 1,
                        max = 10,
                        value = 5),
            sliderInput(inputId = "rightWidth",
                        label = "Right Triangle Width",
                        min = 1,
                        max = 10,
                        value = 5),
            colourInput(inputId = "rightColor",
                        label = "Right Side Color",
                        value = "purple"),
            
            
            # File output options
            textInput(inputId = "fileOutput",
                      label = "Save File Name",
                      value = format(Sys.time(), format = "%Y-%m-%d_%H%M")
            ),
            selectInput(inputId = "dpi",
                        label = "dpi",
                        choices = seq(100,500,by = 50)),
            actionButton(inputId = "save",
                         label = "Save")
            
        ),
        
        mainPanel(
            
            plotOutput(outputId = "plot", height = 800, width = 800)
            
        )
    )
)