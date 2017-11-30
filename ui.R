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
                     tabPanel("Component 2"
                          
                              ),
                     tabPanel("Component 3",
                              plotlyOutput("mapmap")
                              
                              
                              
                              )
)
