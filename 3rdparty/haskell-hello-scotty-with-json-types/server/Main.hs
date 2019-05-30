{-# LANGUAGE OverloadedStrings #-}

import Domain
import Control.Monad.Trans (liftIO)
import Web.Scotty
import Data.Maybe
import Network.HTTP.Types

-- Version 1:
-- main = scotty 3000 $ do
--   get "/" $ do
--     html "Hello World!"

-- Version 2:
main = scotty 3000 $ do
  get "/" $ do
    text "gotten!"
  delete "/" $ do
    text "deleted!"
  post "/" $ do
    text "posted!"
  put "/" $ do
    text "put-ted!"

  -- get a header:
  post "/read-headers" $ do
    agent <- header "User-Agent"
    text (fromJust agent)

  -- set a header:
  post "/set-headers" $ do
    status status302
    setHeader "Location" "http://www.google.com.au"

  -- set content type
  get "/json" $ do
    json ("hello world" :: String)  -- you need types for JSON

  -- get article (json)
  get "/article" $ do
    json $ Article 1 "caption" "content"

  -- post article (json)
  post "/article" $ do
    article <- jsonData :: ActionM Article
    liftIO $ print article
    json article

  -- named parameters:
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>" ]

  -- unnamed parameters from a query string or a form:
  post "/submit" $ do
    name <- param "name"
    text name

  -- match a route regardless of the method
  matchAny "/all" $ do
    text "matches all methods"
  -- handler for when there is no matched route
  -- (this should be the last handler because it matches all routes)
  notFound $ do
    text "there is no such route."
