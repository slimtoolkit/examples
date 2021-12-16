{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}

import Web.Scotty
import Network.HTTP.Types
import Data.Aeson (ToJSON)
import GHC.Generics
import System.Info

data ServiceInfo = ServiceInfo 
  { status    :: String
  , message   :: String
  , stack     :: String
  , framework :: String
  } deriving (Generic, Show, ToJSON)

main = scotty 1300 $ do
  get "/" $ do
    json ServiceInfo { Main.status = "success"
                     , message     = "Hello World!"
                     , stack       = "haskell"
                     , framework   = "scotty"
                     }
