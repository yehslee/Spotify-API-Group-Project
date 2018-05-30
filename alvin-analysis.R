library(dplyr)
library(plotly)
library(stringr)

custom_plot <- function(data, x_axis, y_axis) {
  f <- list(
    family = "Helvetica",
    size = 15,
    color = "#FFFFFF"
  )
  ax <- list(
    title = "Energy",
    titlefont = f,
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    showgrid = FALSE
  )
  ay <- list(
    title = "Happiness",
    titlefont = f,
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    showgrid = FALSE
  )
  l <- list(
    font = list(
      family = "Helvetica",
      size = 12,
      color = "#000"
    ),
    bgcolor = "#E2E2E2"
    # bordercolor = "#FFFFFF",
    # borderwidth = 2
  )
  annot <- data.frame(
    x = c(0, 0, 1, 1), y = c(0, 1, 0, 1),
    text = c("Sad", "Chill/Relaxing", "Turbulent/Angry", "Upbeat")
  )
  p <- plot_ly(
    data,
    x = ~ energy, y = ~ valence,
    text = ~ track_name, color = ~ album_name, type = "scatter",
    colors = "Greens"
  ) %>%
    layout(
      xaxis = ax, yaxis = ay,
      height = 500,
      width = 500,
      plot_bgcolor = "transparent",
      paper_bgcolor = "transparent",
      legend = list(orientation = "h")
    ) %>%
    add_segments(
      x = 0.5, xend = 0.5, y = 0, yend = 1, showlegend = FALSE,
      color = "#1db954"
    ) %>%
    add_segments(
      x = 0, xend = 1, y = 0.5, yend = 0.5, showlegend = FALSE,
      color = "#1db954"
    ) %>%
    add_annotations(
      x = annot$x,
      y = annot$y,
      text = annot$text,
      showarrow = FALSE
    )
  return(p)
}

popularity_plot <- function(data, choice) {
  f <- list(
    family = "Helvetica",
    size = 15,
    color = "#1db954"
  )
  f1 <- list(
    family = "Helvetica",
    size = 10,
    color = "lightgrey"
  )
  ax <- list(
    title = str_to_title(choice),
    titlefont = f,
    tickfont = f1,
    zeroline = FALSE,
    showline = FALSE,
    # showticklabels = FALSE,
    showgrid = FALSE
  )
  y <- list(
    title = "Popularity",
    titlefont = f,
    zeroline = FALSE,
    showline = FALSE,
    # showticklabels = FALSE,
    tickfont = f1,
    showgrid = FALSE
  )
  p1 <- plot_ly(data,
    x = ~ data[, choice],
    y = ~ track_popularity,
    text = ~ track_name, color = ~ album_name, colors = "Greens",
    type = "scatter"
  ) %>%
    layout(
      xaxis = ax, yaxis = y, plot_bgcolor = "transparent",
      paper_bgcolor = "transparent",
      legend = list(
        orientation = "h",
        yanchor = "auto"
      )
    )
}
