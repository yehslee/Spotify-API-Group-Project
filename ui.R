# ui.R
library(shiny)
library(plotly)
library(ggplot2)
library(RColorBrewer)
library(shinythemes)
source("server.R")
source("playlist_plot.R")
shinyUI(navbarPage(
  "MÜD",
  # Create a tab panel for your map
  tabPanel(
    "Playlist",
    titlePanel("Custom Spotify MÜD Playlist"),
    # Create sidebar layout
    sidebarLayout(
      
      # Side panel for controls
      sidebarPanel(
        
        # Input to select variable to map
      textInput("username", 
                label = h3("What is your Spotify Username?"), 
                value = "Username...")
      ,
      radioButtons("playlist_type", label = h3("What are you in the mood for?"),
                   choices = list("Dancing" = "mrlaw98",
                                  "Chilling" = "mrlaw98", 
                                  "Simping" = "mrlaw98") 
                                  )
      ),
      # Main panel: display plotly map
      mainPanel(
        
        fluidRow(column(3, verbatimTextOutput("text")))
        
      )
    )
  )
  
  # Create a tabPanel to show your scatter plot
))
