library(dplyr)
library(plotly)
library(ggplot2)
library(shiny)

source("co2_emissions.R")
co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv",
                     stringsAsFactors = F)

server <- function(input, output) {
  output$gasemissions <- renderPlotly({
    gas_df <- co2_data %>% 
      filter(country == input$country_input) %>% 
      filter(year >= input$year_variable[1] & year <= input$year_variable[2])
    
    gas_co2_plot <- ggplot(data = gas_df) +
      geom_line(mapping = aes(x = year, y = gas_co2, color = country)) +
      labs(
        x= "Year",
        y= "CO2 emissions from gas, measured in million tonnes",
        title = "Annual production based emmisons of CO2 from gas")
    
    return(gas_co2_plot)
  })
  output$Text <- renderText(
    "The annual production-based emissions of carbon dioxide from gas, measured in million tonnes.
    This is based on territorial emissions, which do not account for emissions embedded in trade goods.
    Source: Our World in Data based on the Global Carbon Project (2022)"
  )
}

