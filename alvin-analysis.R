library(dplyr)
library(plotly)
library(stringr)

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

custom_plot <- function(data, x_axis, y_axis) {
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  x <- list(
    title = str_to_title(x_axis),
    titlefont = f
  )
  y <- list(
    title = str_to_title(y_axis),
    titlefont = f
  )
  
  p <- plot_ly(
    data,
    x = ~ data[, x_axis], y = ~ data[, y_axis],
    text = ~ track_name, color = ~ album_name, type = "scatter"
  ) %>%
    layout(xaxis = x, yaxis = y, shapes = list(vline(0.5), hline(0.5)))
  return(p)
}

popularity_plot <- function(data, choice) {
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
  p1 <- plot_ly(data,
    x = ~ data[, choice],
    y = ~ track_popularity,
    text = ~ track_name, color = ~ album_name, type = "scatter"
  ) %>%
    layout(xaxis = x, yaxis = y)
}
