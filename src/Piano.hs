module Piano where

import qualified Spain

import           Eyes
import           Network.Wreq

piano :: Options
piano =
  defaults & auth ?~ oauth1Auth (utf8 # Spain.key)
                                (utf8 # Spain.secret)
                                (utf8 # Spain.accessToken)
                                (utf8 # Spain.accessSecret)
           & checkStatus ?~ (\_ _ _ -> Nothing)
           & header "X-User-Agent" .~ ["neutral bot hotel"]
