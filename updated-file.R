library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
source("api-key.R")

username <- "thealvintran"
youtuber <- GET(paste0("https://www.googleapis.com/youtube/v3/channels?part=contentDetails&forUsername=", username, "&key=", google_key))
youtuber_content <- content(youtuber, "text")
youtuber_body <- fromJSON(youtuber_content)
youtuber_df <- flatten(youtuber_body$items$contentDetails$relatedPlaylists)
uploads_id <- youtuber_df$uploads

temp <- GET(paste0("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&maxResults=50&playlistId=", uploads_id, "&key=", google_key))
temp_content <- content(temp, "text")
temp_body <- fromJSON(temp_content)
temp_df <- flatten(temp_body$items$contentDetails)

video_id <- temp_df$videoId

datalist = list()
for (i in 1:50) {
  loop <- GET(paste0("https://www.googleapis.com/youtube/v3/videos?id=", video_id[[i]],"&key=", google_key,"&part=statistics"))
  loop_content <- content(loop, "text")
  loop_body <- fromJSON(loop_content)
  loop_stats <- flatten(loop_body$items$statistics)
  dislikes <- loop_stats$dislikeCount
  datalist[i] <- dislikes # add it to your list
}
# GOT LIST OF DISLIKES NUMBERS