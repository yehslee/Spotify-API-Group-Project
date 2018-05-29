library(dplyr)
library(plotly)
library(devtools)
library(shiny)

# devtools::install_github("ropensci/plotly")

source("playlist_plot.R")

# Creates a font family to use
fonts <- list(
  sans = "Helvetica",
  mono = "Consolas",
  `Times New Roman` = "DejaVu Serif" 
)

# Creates a visual table using Spotify branding colors
# and the columns can be manually moved
createTable <- function(df, tableHeight = 50){
  nms <- lapply(names(df), function(x){
    return(paste0("<b>", x, "</b>"))
  })
  
  nms <- append(nms, "<b>Top #</b>", after = 0)
  headerValues <- lapply(nms, function(x){return(list(x))})
  
  # Cell Values
  names(df) <- NULL
  cellValues <- apply(df, 2, function(x){return(list(x))})
  cellValues <- lapply(cellValues, function(x){return(unlist(x))})
  
  cellValues <- append(cellValues, list(rownames(df)), after = 0)
  
  # Create the list to pass to plot_ly()
  header <- list(
    values = list("Ranking","Playlist", "Song", "Artist", "Album", "Dance Level" ,"Energy Level"),
    
    # Formatting
    line = list(color = "#b3b3b3"),
    align = c("left", rep("center", ncol(df))),
    font = list(color = "#1db954", size = 16),
    fill = list(color = "#212121")
  )
  
  
  cells <- list(
    values = cellValues,
    
    # Formatting
    line = list(color = '#b3b3b3'),
    align = c('left', rep('right', ncol(df))),
    font = list(color = c('#1db954', rep("#ffffff", ncol(df))), size = 12),
    fill = list(color = c("#212121", rep("#303030", ncol(df)))),
    height = tableHeight
  )
  m <- list(

    pad = 0
  )
  
  p <- plot_ly(
    type = "table",
    header = header,
    cells = cells,
    width = 900,
    height = 1200) %>%
    
    
    layout(xaxis = list(zeroline = F, showgrid = F, showticklabels = F),
           yaxis = list(zeroline = F, showgrid = F, showticklabels = F), 
           plot_bgcolor='transparent',
           paper_bgcolor='transparent', 
           margin = m)
  
  return(p)
}

# Function for the second tab of website

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
      filter(artist == input$artist2) %>%
      select(album_name, track_name, danceability, energy, liveness, valence,
             track_popularity)
    return(popularity_plot(data, input$pop_var))
  })
  
  output$playlist_table <- renderPlotly({
    if(input$playlist_type == "dance") {
      mood <- dance(input$username)
    } else if (input$playlist_type == "chill"){
      mood <- chill(input$username)
    } else{
      mood <- simp(input$username)
    }
    
    return(createTable(mood))
  })
})
