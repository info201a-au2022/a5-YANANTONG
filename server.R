library(shiny)
library(ggplot2)
library(rsconnect)
source("app.R")

shinyServer(function(input, output) {

  output$China_CO2_plot <- renderPlot({
    if(input$select == 1){
    data_visualization_1(input$yearcheckGroup)
    }
  })
  output$China_pop_plot <- renderPlot({
    if(input$select == 1){
    data_visualization_2(input$yearcheckGroup)
    }
  })
  output$U.S_CO2_plot <- renderPlot({
    if(input$select == 2){
    data_visualization_3(input$yearcheckGroup)
    }
  })
  output$U.S_pop_plot <- renderPlot({
    if(input$select == 2){
    data_visualization_4(input$yearcheckGroup)
    }
  })
})
  
       