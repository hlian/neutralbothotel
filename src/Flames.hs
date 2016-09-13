module Flames where

import Data.Aeson
import Network.Wreq

import Eyes
import Piano

status :: Text -> IO (Response Value)
status text_ =
  postWith piano "https://api.twitter.com/1.1/statuses/update.json" form >>= asJSON
  where
    form :: [FormParam]
    form = ["status" := text_]

search :: Text -> IO (Response Value)
search text_ =
  getWith (piano & param "q" .~ [text_]
                 & param "count" .~ ["15"]
                 & param "lang" .~ ["en"]) "https://api.twitter.com/1.1/search/tweets.json" >>= asJSON
