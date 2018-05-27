source("key.R")
library(lubridate)

playlist_name <- get_user_audio_features("barackobama")

playlist_features_parse <- playlist_name %>% 
  select(playlist_name, track_name, artist_name, album_name, track_popularity,
         energy, key, loudness, mode, speechiness, acousticness,
         instrumentalness, liveness, valence, tempo, duration_ms, 
         time_signature, key_mode, danceability)

custom_dance <- playlist_features_parse %>% 
  filter(danceability > .5) %>% 
  filter(energy > .5) %>% 
  select(playlist_name, track_name, artist_name, album_name, danceability, 
         energy)

custom_chill <- playlist_features_parse %>% 
  filter(energy < .2) %>% 
  select(playlist_name, track_name, artist_name, album_name, danceability, 
         energy)





