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
  # theme = shinytheme("slate"),
  "MÜD",
  # Create a tab panel for your map
  tabPanel(
    "Welcome",
    titlePanel(HTML("<h4 id = myheader>Welcome to MÜD</h4 id = myheader>")),
    # Create sidebar layout
    mainPanel(
      tags$div(
        HTML("<body id = maintext> MÜD is a project created using the Spotifyr Library 
                 in order to vizualize artist's songs and mood patterns.
             With this, users can create a personalized playlist that satisfies
             a specific mood and artist.</body id = maintext>"),
        HTML("<br> MÜD can also look through your own playlists to determine which songs
                 might go well together under three distinct moods.
             The table will give you the top 20 songs from your playlist. Give it a try!")
      )
    )
  ),
  tabPanel(
    HTML("<tabnames>Playlist</tabnames>"),
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
    titlePanel(h1("Show Trends in Songs from Artists")),
    # Create sidebar layout
    sidebarLayout(
      # Side panel for controls
      sidebarPanel(
        # Input to select variable to map
        selectInput("artist",
          label = "Which Artist?",
          choices = unique(df$artist)
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
        ),
        radioButtons("pop_var",
          label = h2("Choose the Variable"),
          choices = list(
            "Danceability" = "danceability", "Energy" = "energy",
            "Liveness" = "liveness", "Happiness" = "valence"
          )
        )
      ),
      mainPanel(
        plotlyOutput("pop_plot"),
        HTML("<body> To understand some of these 
             metrics, each of these factors is rated off of Spotify's 
             algorithm and pertains to a specific aspect of the Artist's 
             songs. You'll be able to see how different aspects of Artist's 
             songs affect their popularity among the public.</body>")
      )
    )
  )
))
