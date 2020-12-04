library(dplyr)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(lubridate)
library(stringr)
library(tidyr)
library(DT)
library(shinydashboardPlus)

# Preprocessing overview
overview <- read.csv("data/county_overview.csv")
# overview 
#select * from ...
# where county = "Hawaii"

names(overview) <- c('County',
                     'Population',
                     'Area',
                     'Density',
                     'Flower',
                     'Color',
                     'Largest_Settlement',
                     'Description',
                     'Web')

overview$County = str_trim(overview$County)
mylist <- as.list(overview["County"])

description <- overview[1, "Description"]

covid <- read.csv("data/covid_by_county_in_hawaii.csv")
names(covid) <- c('Date',
                     'County',
                     'State',
                     'Federal_ID',
                     'Cumulative_Cases',
                     'Cumulative_Death')
covid$County = str_trim(covid$County)

