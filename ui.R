library(shiny)
library(plotly)

my.ui <- navbarPage("GROUP ANM",
                     tabPanel("Home",
                              h1("Alexander, Nicholas, and Macklan Present:"),
                              h2("A look into the past of football (soccer)"),
                              p("The dataset that we will be using is called “International Football Results from 1872-2017” from Kaggle. 
                                 The description associated with this dataset says, “An up-to-date dataset of nearly 40,000 international football results”.
                                 It is updated very often and is made by the user MartJ, a data analyst, from Estonia. 
                                 They took results from only men’s international games. 
                                 The data includes date, teams played, score, type of game (friendly vs competitive competition), and the location played. Our target audience are those who are studying the history of international soccer relative to games played and trying to discern certain correlations between how they played, who they played, and where they played.
                                "),
                              uiOutput("git")
                              ),
                     tabPanel("Team vs. Team",
                              titlePanel("How did teams fare against each other over the years?"),
                              
                              sidebarLayout(   
                                sidebarPanel(  
                                  p("Configure Data:"),
                                  textInput('teama', "Home Team's Country", "Argentina"),
                                  textInput('teamb', "Away Team's Country", "Brazil")
                                ),
                                mainPanel(
                                  h1("Data"),
                                  plotlyOutput("teamvsteam")
                                )
                              )
                              ),
                     tabPanel("Trend in US Games Played",
                              titlePanel("Number of games played in the US over a specified period of time"),
                              
                              sidebarLayout(   
                                sidebarPanel(  
                                  p("Choose a timeframe:"),
                                  sliderInput('slide', label = "Timeframe", min = 1885, 
                                              max = 2017, value = c(2000,2017)),
                                  checkboxInput('dim', "3D", value = FALSE)
                                ),
                                mainPanel(
                                  h1("Data"),
                                  plotlyOutput("mapmap")
                                )
                              )
                      ),
                      tabPanel("Number of Wins Per Era",
                               titlePanel("Number of wins for a certain team during a specified era"),
                               
                               sidebarLayout(   
                                 sidebarPanel(  
                                   p("Choose a timeframe:"),
                                   sliderInput('slide2', label = "Timeframe", min = 1885, 
                                               max = 2017, value = c(2000,2017)),
                                   p("Choose a country:"),
                                   textInput('team_spec', "Home Team's Country", "Argentina")
                                 ),
                                 mainPanel(
                                   h1("Data"),
                                   plotlyOutput("numwins")
                                 )
                               )
                               
                               
                              )
                  )
shinyUI(my.ui)
