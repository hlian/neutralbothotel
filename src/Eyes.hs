module Eyes
  ( module Eyes
  , module X
  , Text
  , ByteString) where

import BasePrelude as X hiding ((&), lazy, uncons, index)
import Control.Lens as X
import Data.ByteString (ByteString)
import Data.Text (Text)
import Data.Text.Strict.Lens as X
