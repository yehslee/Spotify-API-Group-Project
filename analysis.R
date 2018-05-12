library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
source("api-key.R")

library(shiny)
my_ui <- fluidPage(
  # A widget: a text input box (save input in the `username` key)
  textInput("youtuber", label = "What is the Youtube Channel?"),
  
  # An output element: a text output (for the `message` key)
  textOutput("message")
)

my_server <- function(input, output) {
  output$count <- renderText({
username <- input$youtuber
base_url <- "https://www.googleapis.com/youtube/v3/"
resource <- "channels?part=snippet&forUsername="
getid_uri <- paste0(base_url, resource, username,"&key=", google_key)
getid <- GET(getid_uri)
getid_content <- content(getid, "text")
getid_body <- fromJSON(getid_content)
getid_df <- flatten(getid_body$items)
user_id <- flatten(getid_body$items$snippet)
username_id <- user_id$title
id <- getid_df$id
description <- user_id$description

youtuber <- GET(paste0("https://www.googleapis.com/youtube/v3/channels?part=statistics&id=", 
                       id, "&key=AIzaSyDH51AIBU564Zem39EZ3KRQhkwKjXil8Io"))
youtuber_content <- content(youtuber, "text")
youtuber_body <- fromJSON(youtuber_content)
youtuber_df <- flatten(youtuber_body$items$statistics)
subscriber_count <- as.numeric(youtuber_df$subscriberCount)
# use the `username` key from input and and return new value
# for the `message` key in output
return subscriber_count
  })
}

shinyApp(ui = my_ui, server = my_server)
