{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}

import Web.Scotty
import Network.HTTP.Types
import Data.Aeson (ToJSON)
import GHC.Generics
import System.Info

data ServiceInfo = ServiceInfo 
  { tid :: String
  , stack     :: String
  , framework :: String
  , sysOs     :: String
  , sysArch   :: String
  , cname     :: String
  } deriving (Generic, Show, ToJSON)

main = scotty 1300 $ do
  get "/" $ do
    tid <- param "tid" `rescue` (\_ -> return "543210")
    json ServiceInfo { tid       = tid
                     , stack     = "haskell"
                     , framework = "scotty"
                     , sysOs     = os 
                     , sysArch   = arch
                     , cname     = compilerName
                     }


