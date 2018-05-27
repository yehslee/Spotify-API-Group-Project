library(dplyr)
library(plotly)
library(stringr)
df <- read.csv("data/artist_df.csv", stringsAsFactors = FALSE)

custom_plot <- function(passed_in_artist, x1, y1, x2) {
  selected_artist <- df %>%
    filter(artist == passed_in_artist) %>%
    select(album_name, track_name, danceability, energy, liveness, valence)

  vline <- function(x = 0, color = "black") {
    list(
      type = "line",
      y0 = 0,
      y1 = 1,
      yref = "paper",
      x0 = x,
      x1 = x,
      line = list(color = color)
    )
  }

  hline <- function(y = 0, color = "black") {
    list(
      type = "line",
      x0 = 0,
      x1 = 1,
      xref = "paper",
      y0 = y,
      y1 = y,
      line = list(color = color)
    )
  }
  p <- plot_ly(
    data = selected_artist, x = ~ x1, y = ~ x2,
    text = ~ track_name, color = ~ album_name
  ) %>%
    layout(shapes = list(vline(0.5), hline(0.5)))
}

popularity_plot <- function(passed_in_artist, choice) {
  passed_in_artist <- "Kanye West"
  choice <- "energy"
  selected_artist <- df %>%
    filter(artist == passed_in_artist) %>%
    select(
      album_name, track_name, danceability, energy, liveness, valence,
      track_popularity
    )
  
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  x <- list(
    title = str_to_title(choice),
    titlefont = f
  )
  y <- list(
    title = "Popularity",
    titlefont = f
  )
  p1 <- plot_ly(selected_artist,
    x = ~ selected_artist[, choice],
    y = ~ track_popularity,
    text = ~ track_name, color = ~ album_name, type = "scatter"
  ) %>% 
    layout(xaxis = x, yaxis = y)
}
