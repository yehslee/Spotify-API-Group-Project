library(dplyr)
library(plotly)
library(stringr)

custom_plot <- function(data, x_axis, y_axis) {
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#FFFFFF"
  )
  ax <- list(
    title = str_to_title(x_axis),
    titlefont = f,
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    showgrid = FALSE
  )
  ay <- list(
    title = str_to_title(y_axis),
    titlefont = f,
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    showgrid = FALSE
  )
  l <- list(
    font = list(
      family = "sans-serif",
      size = 12,
      color = "#000"),
     bgcolor = "#E2E2E2"
    #bordercolor = "#FFFFFF",
    #borderwidth = 2
  )

  p <- plot_ly(
    data,
    x = ~ data[, x_axis], y = ~ data[, y_axis],
    text = ~ track_name, color = ~ album_name, type = "scatter"
  ) %>%
    layout(
      xaxis = ax, yaxis = ay,
      plot_bgcolor = "transparent",
      paper_bgcolor = "transparent"
    ) %>% add_segments(x = 0.5, xend = 0.5, y = 0, yend = 1, showlegend = FALSE) %>%
    add_segments(x = 0, xend = 1, y = 0.5, yend = 0.5, showlegend = FALSE)
  return(p)
}

popularity_plot <- function(data, choice) {
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#ffffff"
  )
  f1 <- list(
    family = "Arial, sans-serif",
    size = 10,
    color = "lightgrey"
  )
  ax <- list(
    title = str_to_title(choice),
    titlefont = f,
    tickfont = f1,
    zeroline = FALSE,
    showline = FALSE,
    #showticklabels = FALSE,
    showgrid = FALSE
  )
  y <- list(
    title = "Popularity",
    titlefont = f,
    zeroline = FALSE,
    showline = FALSE,
    #showticklabels = FALSE,
    tickfont = f1,
    showgrid = FALSE
  )
  p1 <- plot_ly(data,
    x = ~ data[, choice],
    y = ~ track_popularity,
    text = ~ track_name, color = ~ album_name, type = "scatter"
  ) %>%
    layout(xaxis = ax, yaxis = y, plot_bgcolor = "transparent",
           paper_bgcolor = "transparent")
}
