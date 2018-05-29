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
  #theme = shinytheme("slate"),
  "MÜD",
  # Create a tab panel for your map
  tabPanel(
    "Playlist",
    titlePanel(h1("Custom Spotify MÜD Playlist")),
    # Create sidebar layout
    sidebarLayout(
      # Side panel for controls
      sidebarPanel(
        # Input to select variable to map
        textInput("username",
                  label = h3("What is Your Spotify Username?"),
                  value = "barackobama"
        ),
        radioButtons("playlist_type",
                     label = h2("What Are You in the Mood For?"),
                     choices = list(
                       "Dancing" = "dance",
                       "Chilling" = "chill",
                       "Simping" = "simp"
                     )
        )
      ),
      # Main panel: display plotly map
      mainPanel(
         tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        plotlyOutput("playlist_table")
      )
    )
  ),
  tabPanel(
    "Artist",
    titlePanel(h1("Show Trends in Artists")),
    # Create sidebar layout
    sidebarLayout(
      # Side panel for controls
      sidebarPanel(
        # Input to select variable to map
        selectInput("artist",
                    label = "Which Artist?",
                    choices = unique(df$artist)
        ),
        radioButtons("x_var",
                     label = h3("Choose the X-Variable"),
                     choices = list(
                       "danceability", "energy",
                       "happiness" = "valence"
                     )
        ),
        radioButtons("y_var",
                     label = h2("Choose the Y-Variable"),
                     choices = list(
                       "danceability", "energy",
                       "happiness" = "valence"
                     )
        )
      ),
      mainPanel(
        plotlyOutput("plot")
      )
    )
  ),
  tabPanel(
    "Popularity",
    titlePanel(h1("Show Relationships with Track Popularity")),
    # Create sidebar layout
    sidebarLayout(
      # Side panel for controls
      sidebarPanel(
        # Input to select variable to map
        selectInput("artist2",
          label = "Which Artist?",
          choices = unique(df$artist)
        )
        ,
        radioButtons("pop_var",
                     label = h2("Choose the variable"),
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
