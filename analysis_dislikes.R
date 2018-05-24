library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
source("api-key.R")

username <- "buzzfeedvideo"
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
dislikes <- as.numeric(youtuber_df$dislikes)

