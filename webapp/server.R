#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
    
    plotInput <- reactiveValuesToList(input)
    
    createPlot(plotInput = plotInput, onlyInit = F)
    
  })
  
  
  observeEvent(input$save, {
    # Establish directory
    if(basename(getwd()) == "webapp") setwd("..")
    if(!dir.exists("output")) dir.create("output")

    # Establish file name
    f <- paste0(input$fileOutput,".png")
    saveFileName <- file.path(getwd(),"output", f)
    
    cat(sprintf("\nSaving to:\t%s", saveFileName))
    
    png(filename = saveFileName)
    
    initPlot()
    
    createPlot(plotInput = reactiveValuesToList(input), onlyInit = F, axesAndGrid = F)
    
    dev.off()
  })
  
})
