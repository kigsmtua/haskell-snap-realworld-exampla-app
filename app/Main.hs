{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Applicative
import Snap.Core
import Snap.Util.FileServe
import Snap.Http.Server

-- Does this even involve using a language in production
import Database

main :: IO ()
main = do
   -- Run migrations
   -- Does this even make any sort of chance and change
   -- Does this even mean anythingb
   quickHttpServe site

   -- Proceed to run application server

site :: Snap ()
site = ifTop (writeBS "hello world")
    <|> route [ ( "foo", writeBS "bar" ), ( "echo/:echoparam", echoHandler ) ]
    <|> dir "static" (serveDirectory ".")

echoHandler :: Snap ()
echoHandler = do
    param <- getParam "echoparam"
    maybe (writeBS "must specify echo/param in URL") writeBS param
