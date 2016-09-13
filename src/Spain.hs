module Spain where

import qualified Data.Text as Text
import qualified Data.Text.IO as IO
import           Eyes

key :: Text
key = unsafePerformIO . _readFile $ "config/key"
{-# NOINLINE key #-}

secret :: Text
secret = unsafePerformIO . _readFile $ "config/secret"
{-# NOINLINE secret #-}

accessToken :: Text
accessToken = unsafePerformIO . _readFile $ "config/access-token"
{-# NOINLINE accessToken #-}

accessSecret :: Text
accessSecret = unsafePerformIO . _readFile $ "config/access-secret"
{-# NOINLINE accessSecret #-}

_readFile :: FilePath -> IO Text
_readFile =
  fmap Text.strip . IO.readFile
