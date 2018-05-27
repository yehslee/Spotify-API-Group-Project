source("key.R")
library(lubridate)
name <- "12128148128"
playlist_name <-get_user_audio_features(name)

playlist_features_parse <- playlist_name %>% 
  select(playlist_name, track_name, artist_name, album_name, track_popularity,
         energy, key, loudness, mode, speechiness, acousticness,
         instrumentalness, liveness, valence, tempo, duration_ms, 
         time_signature, key_mode, danceability)

custom_dance <- playlist_features_parse %>% 
  filter(danceability > .7) %>% 
  filter(energy > .5) %>% 
  select(playlist_name, track_name, artist_name, album_name, danceability, 
         energy) %>% 
  arrange(-danceability)

custom_chill <- playlist_features_parse %>% 
  filter(energy < .5) %>%
  filter(acousticness > .5) %>% 
  select(playlist_name, track_name, artist_name, album_name, 
         energy, acousticness) %>% 
  arrange(energy)

custom_simp <- playlist_features_parse %>% 
  filter(valence < .3) %>%
  filter(energy < .3) %>% 
  select(playlist_name, track_name, artist_name, album_name, 
         energy, valence) %>% 
  arrange(valence)







