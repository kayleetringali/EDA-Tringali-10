#############################################
# Shiny app - Assignment 10                 
# STAT442 - Kaylee Tringali                 
#
# DEPLOYED AT: https://kmtringali.shinyapps.io/Assignment-10/
# SOURCE CODE AT GITHUB: https://github.com/kayleetringali/EDA-Tringali-10 
############################################


# Importing libraries
library(readr)
library(shiny)
library(dplyr)
library(ggplot2)

# Load the accident dataset
accidents <- read_csv("accident.csv")

# Aggregate data to calculate the count of accidents
aggregated_data <- accidents %>%
  group_by(MONTHNAME, DAY_WEEKNAME) %>%
  summarize(Count = n())  # Calculate the count of accidents for each month and day of the week

# Define UI for the application
ui <- fluidPage(
  titlePanel("Car Accidents Analysis"),
  sidebarLayout(
    sidebarPanel(
      h3("Filter the Data"),
      selectInput(
        inputId = "SelectMonth",
        label = "Select Month(s)",
        choices = unique(aggregated_data$MONTHNAME),  # Dropdown to select months
        multiple = TRUE
      ),
      selectInput(
        inputId = "SelectDayOfWeek",
        label = "Select Day(s) of the Week",
        choices = unique(aggregated_data$DAY_WEEKNAME),  # Dropdown to select days of the week
        multiple = TRUE
      ),
      p("Select one or more months and days of the week to analyze car accidents.")
    ),
    mainPanel(
      plotOutput("accidentsPlot")  # Plot area for displaying the line chart
    )
  )
)

# Define server logic
server <- function(input, output) {
  filteredData <- reactive({
    aggregated_data %>%
      filter(MONTHNAME %in% input$SelectMonth,  # Filter data based on selected months
             DAY_WEEKNAME %in% input$SelectDayOfWeek)  # Filter data based on selected days of the week
  })
  
  output$accidentsPlot <- renderPlot({
    d <- filteredData()
    
    ggplot(data = d, mapping = aes(x = MONTHNAME, y = Count, color = DAY_WEEKNAME, group = DAY_WEEKNAME)) +
      geom_line() +  # Create a line chart
      labs(
        title = "Trend of Accidents by Month and Day of the Week",
        x = "Month",
        y = "Number of Accidents",
        color = "Day of the Week"
      ) +  # Customize chart labels
      theme_minimal()  # Use a minimal theme for the chart
  })
}

# Run the application
shinyApp(ui = ui, server = server)

