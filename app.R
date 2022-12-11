library(shiny)
library(rsconnect)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)

source("app_ui.R")
source("app_server.R")
source("co2_emissions.R")

shinyApp(ui = ui, server = server)
