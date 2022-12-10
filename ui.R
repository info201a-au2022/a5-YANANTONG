library(shiny)
library(ggplot2)
library(DT)
library(rsconnect)

source("app.R")

page_one <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  
  p("Exposure to excess amount of Carbon Dioxide will have huge impacts on human's health. 
  China and the United States are the world's largest and second largest emitters of carbon 
  dioxide. My research will start with these two countries and their populations to see how the their population impact their CO2 emission. I will collect 
  data for the past five years, that is, from 2016 to 2021. investigation. According to calculations, 
  China's average carbon dioxide emissions in the past five years are 10549.92 metric ton, and the average 
  emissions of the United States are 5136.924 metric ton pound, while the average population difference between China 
  and the United States in the past five years is 1.084 billion.")
)

page_two <- tabPanel(
  "Interactive Panel", 
  headerPanel("How does the population of China and the United States affect 
              the carbon dioxide emissions of the two countries?"),
  sidebarPanel(
    checkboxGroupInput("yearcheckGroup", label = h3("Year Checkbox"), 
                       choices = list("2016" = 2016, "2017" = 2017, "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021),
                       selected = 2016),
    selectInput("select", label = h3("Select box"), 
                choices = list("China" = 1, "United States" = 2), 
                selected = 1)
  ),
  mainPanel(
    plotOutput("China_CO2_plot"), plotOutput("China_pop_plot"), plotOutput("U.S_CO2_plot"), plotOutput("U.S_pop_plot"),
    h4("Chart summary"),
    p("My data visualization analyzes how a country's population change will affect the country's 
    carbon dioxide emissions by comparing the changes in population and carbon dioxide emissions in China 
    and the United States. Users can select any year from 2016 to 2021 to view data through the check box, 
      and users can also switch between China and the United States through the select box.Through the final 
      data visualization, it can be found that China's population and carbon dioxide will only increase from 
      2016 to 2021. Although the population of the United States has also shown an upward trend in recent years, 
      the carbon dioxide in the United States has shown a downward trend in 2019 and 2020, which shows that sometimes 
      there is no direct relationship between carbon dioxide emissions and the increase in population, perhaps Policies 
      are the best reason to improve it."), 
  )
)

ui <- fluidPage( 
  navbarPage (
    "CO2 emissions of China Vs. U.S",
    page_one,
      page_two
)
)