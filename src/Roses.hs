{-# LANGUAGE NoImplicitPrelude #-}

module Roses where

import qualified Data.Aeson as Aeson
import           Data.Aeson.Lens
import qualified Data.ByteString as Bytes
import qualified Data.Set as Set
import qualified Data.Text as Text
import qualified Data.Text.Lazy.Builder as Builder
import qualified HTMLEntities.Decoder as HTML

import           Eyes
import qualified Flames as Flames
import           Network.Wreq
import           Piano


main :: Text -> IO ()
main q = do
  r <- Flames.search q
  let statuses = r ^.. responseBody . key "statuses" . _Array . traverse . key "text" . _String
  print (filter unclean (map clean statuses))

unclean tokens =
  Set.null (Set.intersection ["rt", "gender"] (Set.fromList tokens))

clean =
  Text.words . Text.toLower . view strict . Builder.toLazyText . HTML.htmlEncodedText
