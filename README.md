# EDA-Tringali-10
# Car Accidents Analysis Shiny App - Kaylee Tringali
# DEPLOYED AT: https://kmtringali.shinyapps.io/Assignment-10/

## Overview

This Shiny app addresses the analysis of car accidents data to identify patterns and trends. It provides insights into accidents based on months, days of the week, and geographical locations.

## Features

- Select and filter data by months and days of the week.
- View trends in accidents using line charts.
- Explore accident locations on an interactive map.

## Data Source

The dataset used in this app is based on real-world car accidents data.

## How to Use

1. Clone or download this repository to your local machine.

2. Install the required R packages mentioned in the `global.R` file using `install.packages()`.

3. Run the Shiny app by executing the following code in R:
- Replace "path_to_the_app_directory" with actual path to the app directory on local machine

```R
library(shiny)
runApp("path_to_the_app_directory")
