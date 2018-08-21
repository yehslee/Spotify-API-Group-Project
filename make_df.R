library(spotifyr)
library(dplyr)

source("alvin-analysis.R")
Sys.setenv(SPOTIFY_CLIENT_ID = "6fba02969ff44c8892e1e562ff7d2ce3")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "42f0606c30ec444195c5687a1d03550d")

access_token <- get_spotify_access_token()

artist_df <- get_artist_audio_features("Adele") %>% mutate(artist = "Adele")
artist_df <- rbind(artist_df, get_artist_audio_features("Kanye West") %>%
  mutate(artist = "Kanye West"))
artist_df <- rbind(artist_df, get_artist_audio_features("Khalid") %>%
  mutate(artist = "Khalid"))
artist_df <- rbind(artist_df, get_artist_audio_features("Sam Smith") %>%
  mutate(artist = "Sam Smith"))
artist_df <- rbind(artist_df, get_artist_audio_features("Ed Sheeran") %>%
  mutate(artist = "Ed Sheeran"))
artist_df <- rbind(artist_df, get_artist_audio_features("Drake") %>%
  mutate(artist = "Drake"))
artist_df <- rbind(artist_df, get_artist_audio_features("Post Malone") %>%
  mutate(artist = "Post Malone"))
artist_df <- rbind(artist_df, get_artist_audio_features("Kendrick Lamar") %>%
  mutate(artist = "Kendrick Lamar"))
artist_df <- rbind(
  artist_df,
  get_artist_audio_features("Trampled by Turtles") %>%
    mutate(artist = "Trampled by Turtles")
)
artist_df <- rbind(artist_df, get_artist_audio_features("Dua Lipa") %>%
  mutate(artist = "Dua Lipa"))
artist_df <- rbind(artist_df, get_artist_audio_features("Kehlani") %>%
  mutate(artist = "Kehlani"))
artist_df <- rbind(artist_df, get_artist_audio_features("Taylor Swift") %>%
  mutate(artist = "Taylor Swift"))
artist_df <- rbind(artist_df, get_artist_audio_features("Beyonce") %>%
  mutate(artist = "Beyonce"))
artist_df <- rbind(artist_df, get_artist_audio_features("Frank Ocean") %>%
                     mutate(artist = "Frank Ocean")) 

artist_df <- artist_df %>%
  filter(!(album_name ==
    "Speak Now World Tour Live (スピーク ・ ナウ・ワールド ・ ツアー・ライヴ)"))

write.csv(artist_df, file = "data/artist_df.csv", row.names = FALSE)
