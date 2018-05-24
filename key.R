library(spotifyr)
library(dplyr)
Sys.setenv(SPOTIFY_CLIENT_ID = '6fba02969ff44c8892e1e562ff7d2ce3')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '42f0606c30ec444195c5687a1d03550d')
access_token <- get_spotify_access_token()

 