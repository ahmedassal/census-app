
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("loader.R")
  
initialize()
downloadData()
loadData()

shinyServer(function(input, output) {
  
#   output$text1 <- renderText({
#     paste("You have selected: ",input$var)
#   })
#   
#   output$text2 <- renderText({
#     paste("You have chosen a range that goes from ", input$range[1], "to", input$range[2])
#   })
  
  output$map <- renderPlot({
    args <- switch(input$var,
                   "Percent White" = list(counties$white, "darkgreen", "% White"),
                   "Percent Black" = list(counties$black, "black", "% Black"),
                   "Percent Hispanic" = list(counties$hispanic, "darkorange", "% Hispanic"),
                   "Percent Asian" = list(counties$asian, "darkviolet", "% Asian"))
    
    args$min <- input$range[1]
    args$max <- input$range[2]
    
    do.call(percent_map, args)
  })
  

})
  