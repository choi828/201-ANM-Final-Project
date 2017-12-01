library(shiny)
library(ggplot2)
library(leaflet)
library(plotly)

soccer.data <- read.csv("data/results.csv")
codes.data <- read.csv("data/names.with.codes.csv")
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
  })
    output$mapmap <- renderPlotly({
      l <- list(color = toRGB("grey"), width = 0.5)
      g <- list(
        showframe = TRUE,
        showcoastlines = FALSE,
        projection = list(type = 'Mercator')
      )
      p <- plot_geo(codes.data) %>%
        add_trace(
          z = ~n, color = ~n, colors = 'Blues',
          text = ~country, locations = ~codes, marker = list(line = l)
        ) %>%
        colorbar(title = 'Number of Games Played') %>%
        layout(
          title = "Number of Games Played in Each Country Throughout the World",
          geo = g
        )
       p
    })
  
}