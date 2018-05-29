source("key.R")
library(lubridate)
library(dplyr)

# Creates a table of playlists that is "danceable"
dance <- function(name){
  custom_dance <- get_user_audio_features(name) %>% 
    filter(danceability > .7) %>% 
    filter(energy > .5) %>% 
    select(playlist_name, track_name, artist_name, album_name, danceability, 
           energy) %>%
    arrange(-danceability)
  colnames(custom_dance) <- c("Playlist", "Song", "Artist", "Album", "Dance Level" ,"Energy Level")
  
  return(head(custom_dance, n = 20))
}

# Creates a table of "chill" playlists
chill <- function(name){
  custom_chill <- get_user_audio_features(name) %>% 
    filter(energy < .5) %>%
    filter(acousticness > .5) %>% 
    select(playlist_name, track_name, artist_name, album_name, 
           energy, acousticness) %>% 
    arrange(energy)
  colnames(custom_chill) <- c("Playlist", "Song", "Artist", "Album", "Energy Level" ,"Acousticness")
  
  return(head(custom_chill, n = 20))
}

# Creates a table of "simp" playlists
simp <- function(name){
  custom_simp <- get_user_audio_features(name) %>% 
    filter(valence < .3) %>%
    filter(energy < .3) %>% 
    select(playlist_name, track_name, artist_name, album_name, 
           energy, valence) %>% 
    arrange(valence)
  colnames(custom_simp) <- c("Playlist", "Song", "Artist", "Album", "Energy Level" ,"Valence")
  
  return(head(custom_simp, n = 20))
}
