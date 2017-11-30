library(shiny)
library(ggplot2)
library(leaflet)
library(plotly)

soccer.data <- read.csv("~/201-ANM-Final-Project/data/results.csv")
my.server <- function(input, output) {
  
  output$teamvsteam <- renderPlotly({
    team.data <- soccer.data %>% filter(home_team == input$teama & away_team == input$teamb)
    
    f <- list(family = "Courier New, monospace", size = 18, color = "#7f7f7f")
    x <- list(title = "Date", titlefont = f)
    y <- list(title = "Score Differential (+/-)", titlefont = f)
    pl <- plot_ly(x = team.data$date, y= (team.data$home_score - team.data$away_score),
      type = "scatter",
      mode = "markers") %>% layout(title = "Home Team vs Away Team Scores", xaxis = x, yaxis = y)
    print(pl)
    
    map <- 
  })
    
  
}