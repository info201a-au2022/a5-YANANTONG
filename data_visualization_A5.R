library(dplyr)
library(ggplot2)
library(plotly)
library(tidyverse)
library(tidyr)
library(rsconnect)


owid_co2_data <- read.csv("owid-co2-data.csv", header = TRUE)

China_average_CO2_5yr <- owid_co2_data %>%
  filter(country == "China") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  summarize(China_average_CO2_5yr = mean(co2, na.rm = TRUE))

U.S_average_CO2_5yr <- owid_co2_data %>%
  filter(country == "United States") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  summarize(U.S_average_CO2_5yr = mean(co2, na.rm = TRUE))

China_average_pop_5yr <- owid_co2_data %>%
  filter(country == "China") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  summarize(China_average_pop_5yr = mean(population, na.rm = TRUE))

U.S_average_pop_5yr <- owid_co2_data %>%
  filter(country == "United States") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  summarize(U.S_average_pop_5yr = mean(population, na.rm = TRUE))

China_U.S_average_pop_diff <- China_average_pop_5yr - U.S_average_pop_5yr


China_CO2_in_5yr <- owid_co2_data %>%
  filter(country == "China") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  select(co2) 

year <- c("2016", "2017", "2018", "2019", "2020", "2021")
China_CO2_in_5yr_df <- data.frame(year, China_CO2_in_5yr)


China_pop_in_5yr <- owid_co2_data %>%
  filter(country == "China") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  select(population)
  
China_pop_in_5yr_df <- data.frame(year, China_pop_in_5yr)
get_year_data <- function(years){
  filter(China_CO2_in_5yr_df, year == years)
}
  


data_visualization_1 <- function(years) {
  
  China_CO2_df <- get_year_data(years)
  
  China_CO2_chart <- 
    ggplot(data = China_CO2_df) +
    geom_col(mapping = aes(x = year, y = co2), color = "orange", fill = "orange") + 
    labs(x = "Years", y = "CO2 Emissions", title = "China's Changes in CO2 Emissions in 5 years") 
  
  return(China_CO2_chart)
}




get_year_data_2 <- function(years){
  filter(China_pop_in_5yr_df, year == years)
}


data_visualization_2 <- function(years) {
  
  China_pop_df <- get_year_data_2(years)
  
  China_pop_chart <- 
    ggplot(data = China_pop_df) +
    geom_col(mapping = aes(x = year, y = population), color = "blue", fill = "blue") + 
    labs(x = "Years", y = "Population", title = "China's Changes in population in 5 years") 
  
  return(China_pop_chart)
}


U.S_CO2_in_5yr <- owid_co2_data %>%
  filter(country == "United States") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  select(co2)

U.S_CO2_in_5yr_df <- data.frame(year, U.S_CO2_in_5yr)

U.S_pop_in_5yr <- owid_co2_data %>%
  filter(country == "United States") %>%
  filter(year %in% c("2016", "2017", "2018", "2019", "2020", "2021")) %>%
  select(population)

U.S_pop_in_5yr_df <- data.frame(year, U.S_pop_in_5yr)

get_year_data_3 <- function(years){
  filter(U.S_CO2_in_5yr_df, year == years)
}
 

data_visualization_3 <- function(years) {
  
  U.S_CO2_df <- get_year_data_3(years)
  
  U.S_CO2_chart <- 
    ggplot(data = U.S_CO2_df) +
    geom_col(mapping = aes(x = year, y = co2), color = "red", fill = "red") + 
    labs(x = "Years", y = "CO2 emissions", title = "U.S's Changes in CO2 emissions in 5 years") 
  
  return(U.S_CO2_chart)
}

test <- data_visualization_3(c("2016", "2017"))
test

get_year_data_4 <- function(years){
  filter(U.S_pop_in_5yr_df, year == years)
}

data_visualization_4 <- function(years) {
  
  U.S_pop_df <- get_year_data_4(years)
  
  U.S_pop_chart <- 
    ggplot(data = U.S_pop_df) +
    geom_col(mapping = aes(x = year, y = population), color = "black", fill = "black") + 
    labs(x = "Years", y = "Population", title = "U.S's Changes in population in 5 years") 
  
  return(U.S_pop_chart)
}

test <- data_visualization_4(c("2016", "2017"))
test
