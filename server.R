library(dplyr)
library(plotly)
library(devtools)

source("./playlist_plot.R")

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
    values = headerValues,
    
    # Formatting
    line = list(color = "#b3b3b3"),
    align = c('left', rep('center', ncol(df))),
    font = list(color = '#1db954', size = 16),
    fill = list(color = '#121212')
  )
  
  cells <- list(
    values = cellValues,
    
    # Formatting
    line = list(color = '#b3b3b3'),
    align = c('left', rep('right', ncol(df))),
    font = list(color = c("#ffffff"), size = 12),
    fill = list(color = c("#121212", rep("#535353", ncol(df)))),
    height = tableHeight
  )
  
  p <- plot_ly(
    type = "table",
    header = header,
    cells = cells,
    width = 1200,
    height = 1600) %>%
    
    layout(xaxis = list(zeroline = F, showgrid = F, showticklabels = F),
           yaxis = list(zeroline = F, showgrid = F, showticklabels = F))
  
  return(p)
}

p <- createTable(simp_name)

