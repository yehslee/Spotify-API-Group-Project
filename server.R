library(dplyr)
library(plotly)
source("playlist_plot.R")
source("alvin-analysis.R")

df <- read.csv("data/artist_df.csv", stringsAsFactors = FALSE)

shinyServer(function(input, output) { 
   
  output$text <- renderPrint({input$username})
  
  output$plot <- renderPlotly({
    data <- df %>%
      filter(artist == input$artist) %>%
      select(album_name, track_name, danceability, energy, liveness, valence)
    return(custom_plot(data, input$x_var, input$y_var))
  })
  
  output$pop_plot <- renderPlotly({
    data <- df %>% 
      filter(artist == input$artist) %>%
      select(album_name, track_name, danceability, energy, liveness, valence,
             track_popularity)
    return(popularity_plot(data, input$pop_var))
  })
})
