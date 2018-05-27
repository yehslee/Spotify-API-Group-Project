source("key.R")
library(lubridate)
library(dplyr)
dance <- function(name){
  playlist_info <-get_user_audio_features(name)
  
  playlist_info <- playlist_info %>% 
  select(playlist_name, track_name, artist_name, album_name, track_popularity,
         energy, key, loudness, mode, speechiness, acousticness,
         instrumentalness, liveness, valence, tempo, duration_ms, 
         time_signature, key_mode, danceability)

custom_dance <- playlist_info %>% 
  filter(danceability > .7) %>% 
  filter(energy > .5) %>% 
  select(playlist_name, track_name, artist_name, album_name, danceability, 
         energy) %>% 
  arrange(-danceability)

return(custom_dance)
}

chill <- function(name){
  playlist_info <-get_user_audio_features(name)
  
  playlist_info <- playlist_info %>% 
    select(playlist_name, track_name, artist_name, album_name, track_popularity,
           energy, key, loudness, mode, speechiness, acousticness,
           instrumentalness, liveness, valence, tempo, duration_ms, 
           time_signature, key_mode, danceability)
  custom_chill <- playlist_info %>% 
    filter(energy < .5) %>%
    filter(acousticness > .5) %>% 
    select(playlist_name, track_name, artist_name, album_name, 
           energy, acousticness) %>% 
    arrange(energy)
  
  
  return(custom_chill)
}


simp <- function(name){
  playlist_info <-get_user_audio_features(name)
  
  playlist_info <- playlist_info %>% 
    select(playlist_name, track_name, artist_name, album_name, track_popularity,
           energy, key, loudness, mode, speechiness, acousticness,
           instrumentalness, liveness, valence, tempo, duration_ms, 
           time_signature, key_mode, danceability)
  
  custom_simp <- playlist_info %>% 
    filter(valence < .3) %>%
    filter(energy < .3) %>% 
    select(playlist_name, track_name, artist_name, album_name, 
           energy, valence) %>% 
    arrange(valence)
  
  
  return(custom_simp)
}
