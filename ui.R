library(plotly)
library(bslib)
library(shiny)
library(dplyr)

source("co2_emissions.R")
co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv",
                     stringsAsFactors = F)
                                            
intro_tab <- tabPanel(
                      "Introduction",
                      h1("CO2 emissions: values of interest"),
                        fluidPage(
                          p(paste("Hello! Welcome to my A5 assignment. Here are my three value interest of CO2
                                  emissions down below. This project includes CO2 emissions per capita, annual 
                                  growth of CO2 emissions, and percentage growth rate of CO2 emissions. The interactive
                                  Visualization page shows the emission pattern from gas in different countries by years.")),
                          p(paste("The maximum value of total production-based smissions of carbon dioxide,
                          excluding land-use change (measured in tonnes per person) in year 2021 is ", max_co2_per_capita)),
                          p(paste("The maximum value of growth in total production-based emissions of carbon dioxide,
                          excluding land-use change (measured in million tonnes) in year 2021 is ", max_co2_growth_abs)),
                          p(paste("The maximum value of percentage growth in total production-based smissions of carbon dioxide
                                  in year 2021 is", max_co2_growth_prct))
                        )
)
                                
sidebar_widget <- sidebarPanel(
  selectInput(
    inputId = "country_input",
    label = "Select Your Country",
    choices = co2_data$country,
    selected = co2_data$country[1],
    multiple = TRUE
    ),
    sliderInput(inputId = "year_variable",
    label = h3("Time Period"),
    min = min(co2_data$year),
    max = max(co2_data$year),                                                      
    sep = "",
    #default value
    value = c(1949, 2016))
)
                                            
main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "gasemissions"),
  textOutput(outputId = "Text")
)

  interactive_tab <- tabPanel(
    "Interactive Visualization",
    sidebarLayout(
      sidebar_widget,
      main_panel_plot
    )
  )
  
ui <- navbarPage(
  theme = bs_theme(bootswatch = "vapor"),
  "CO2 Emissions trends visualization",
  intro_tab,
  interactive_tab
)