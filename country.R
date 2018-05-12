library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
library(plotly)

country <- GET("https://restcountries.eu/rest/v2/all")
country_content <- content(country, "text")
country_body <- fromJSON(country_content)
country_df <- select(country_body, name, population, alpha3Code)

source("analysis.R")
#temp <- country_df %>% filter(subscriber_count < country_df$population)
#temp <- country_df %>% mutate("new" = (population - subscriber_count))
temp <- country_df
temp[temp$population > subscriber_count , "new"] <- 1
temp[temp$population < subscriber_count , "new"] <- 0
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

p <- plot_geo(temp) %>%
    add_trace(
      z = ~new, color = ~new, colors = 'Blues',
      text = ~paste(name, "<br>", population), 
                    locations = ~alpha3Code, marker = list(line = l),
      showscale = FALSE
    ) %>%
  layout(
    geo = g
  )