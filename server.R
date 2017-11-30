library(shiny)
library(ggplot2)
library(leaflet)
library(plotly)

soccer.data <- read.csv("~/201-ANM-Final-Project/data/results.csv")
my.server <- function(input, output) {
  
  output$teamvsteam <- renderPlotly({
    team.data <- soccer.data %>% filter(home_team == input$teama & away_team == input$teamb)
    pl <- plot_ly(x = team.data$date, y= (team.data$home_score - team.data$away_score),
      type = "scatter",
      mode = "markers")
    print(pl)
  })
    
  
}