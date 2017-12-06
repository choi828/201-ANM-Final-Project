library(shiny)
library(plotly)

# get all data and take it out of vector form
soccer.data <- read.csv("~/201-ANM-Final-Project/data/results.csv")
soccer.data <- data.frame(lapply(soccer.data, as.character), stringsAsFactors=FALSE)
soccer.data$home_score <- as.numeric(soccer.data$home_score)
soccer.data$away_score <- as.numeric(soccer.data$away_score)
#
my.server <- function(input, output) {
  
    output$teamvsteam <- renderPlotly({
      # filter data to input specifics
      team.data <- soccer.data %>% filter(home_team == input$teama & away_team == input$teamb)
      f <- list(family = "Courier New, monospace", size = 18, color = "#7f7f7f")
      x <- list(title = "Date", titlefont = f)
      y <- list(title = "Score Differential (+/-)", titlefont = f)
      # plot graph
      pl <- plot_ly(x = team.data$date, y= (team.data$home_score - team.data$away_score),
        type = "scatter",
        mode = "markers") %>% layout(title = "Home Team vs Away Team Scores", xaxis = x, yaxis = y)
      print(pl)
    })
    
    output$numwins <- renderPlotly({
      # filter data to input specifics
      win.data <- soccer.data %>% filter(home_team == input$team_spec)
      win.data$diff <- win.data$home_score - win.data$away_score
      # make a new column with just years to group by
      win.data$year <- format(as.Date(win.data$date, format="%Y-%m-%d"),"%Y")
      win.data <- win.data %>% filter(diff > 0) %>%
        filter(date >= input$slide2[1] & date <= input$slide2[2])
      win.data <- win.data %>% group_by(year) %>% summarise(n = n())
      # plot graph
      pw <- plot_ly(win.data, x = ~year, y = ~n, type = 'scatter', 
                   mode = 'lines')
      print(pw)
    })
    
    output$mapmap <- renderPlotly({
      # filter data to input specifics
      us.data <- soccer.data %>% 
        filter(date >= input$slide[1] & date <= input$slide[2]) %>%
        filter(country == 'USA')
      # make a new column with just years to group by
      us.data$year <- format(as.Date(us.data$date, format="%Y-%m-%d"),"%Y")
      if (input$dim == TRUE) { # If you want it in 3d
          us.data <- us.data %>% group_by(tournament, year) %>% summarise(n = n())
          p <- plot_ly(us.data, x = ~year, y = ~tournament, z = ~n, type = 'scatter3d', 
                       mode = 'lines')
      } else { # if you do not want it in 3d
          us.data <- us.data %>% group_by(year) %>% summarise(n = n())
          p <- plot_ly(us.data, x = ~year, y = ~n, type = 'scatter', 
                       mode = 'lines')
      }
      print(p)
    })
  
}