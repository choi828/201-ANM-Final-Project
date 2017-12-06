library(shiny)
library(ggplot2)
library(leaflet)
library(plotly)

my.ui <- navbarPage("My Application",
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
                                              max = 2017, value = c(1885,2017)),
                                  checkboxInput('dim', "3D", value = FALSE)
                                ),
                                mainPanel(
                                  h1("Data"),
                                  plotlyOutput("mapmap")
                                )
                              )
                      ),
                      tabPanel("Macklan's Graph",
                               titlePanel("title"),
                               
                               sidebarLayout(   
                                 sidebarPanel(  
                                   
                                 ),
                                 mainPanel(
                                   h1("Data")
                              
                                 )
                               )
                               
                               
                              )
                  )
shinyUI(my.ui)
