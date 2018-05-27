# ui.R
library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(shinythemes)
source("server.R")
source("playlist_plot.R")
source("alvin-analysis.R")
shinyUI(navbarPage(
  theme = shinytheme("slate"),
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
                  value = "Username..."
        )
        ,
        radioButtons("playlist_type",
                     label = h3("What are you in the mood for?"),
                     choices = list(
                       "Dancing" = "dance",
                       "Chilling" = "chill",
                       "Simping" = "simp"
                     )
        )
      ),
      # Main panel: display plotly map
      mainPanel(
        plotlyOutput("playlist_table")
      )
    )
  ),
  tabPanel(
    "Artist",
    titlePanel("Show trends in artists"),
    # Create sidebar layout
    sidebarLayout(
      
      # Side panel for controls
      sidebarPanel(
        
        # Input to select variable to map
        selectInput("artist",
                    label = "Which artist?",
                    choices = unique(df$artist)
        )
        ,
        radioButtons("x_var",
                     label = h3("Choose the x-variable"),
                     choices = list(
                       "danceability", "energy",
                       "happiness" = "valence"
                     )
        )
        ,
        radioButtons("y_var",
                     label = h3("Choose the y-variable"),
                     choices = list(
                       "danceability", "energy",
                       "happiness" = "valence"
                     )
        )
      ),
      #   ,
      #   radioButtons("pop_var",
      #     label = h3("Choose the variable"),
      #     choices = list(
      #       "danceability", "energy", "liveness",
      #       "happiness" = "valence"
      #     )
      #   )
      # ),
      mainPanel(
        plotlyOutput("plot")
        # plotlyOutput("pop_plot")
      )
    )
  ),
  tabPanel(
    "Popularity",
    titlePanel("Show relationships with track popularity"),
    # Create sidebar layout
    sidebarLayout(

      # Side panel for controls
      sidebarPanel(

        # Input to select variable to map
        selectInput("artist",
          label = "Which artist?",
          choices = unique(df$artist)
        )
        ,
        radioButtons("pop_var",
                     label = h3("Choose the variable"),
                     choices = list(
                       "danceability", "energy", "liveness",
                       "happiness" = "valence"
                     )
        )
      ),
      mainPanel(
        plotlyOutput("pop_plot")
      )
    )
  )
))
