{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE StandaloneDeriving #-}

module Model where

import Data.Time.Clock ( UTCTime(..) )
import Data.Text
import Database.Persist
import Database.Persist.Sqlite
import Database.Persist.TH

share [ mkPersist sqlSettings, mkDeleteCascade sqlSettings, mkMigrate "migrateAll" ][persistLowerCase|
   User
      email Text
      username Text
      password Text
      bio Text
      image Text
      createdAt UTCTime
      updatedAt UTCTime
      UniqueUserEmail email
      deriving Show

   UserFollower
      user UserId
      follower UserId
      UniqueUserFollower user follower
      createdAt UTCTime
      updatedAt UTCTime
      deriving Show

   Article
      author UserId
      title  Text
      slug   Text
      description Text
      body Text
      createdAt UTCTime
      updatedAt UTCTime
      UniqueArticleSlug slug
      deriving Show

   Tag
      name Text
      UniqueTagName name
      createdAt UTCTime
      updatedAt UTCTime
      deriving Show

   ArticleFavorite
      article ArticleId
      user UserId
      UniqueArticleFavorite article user
      createdAt UTCTime
      updatedAt UTCTime
      deriving Show

   ArticleTag
      article ArticleId
      tag TagId
      UniqueArticleTag article tag
      createdAt UTCTime
      updatedAt UTCTime
      deriving Show

   ArticleComment
      article ArticleId
      user UserId
      body Text
      createdAt UTCTime
      updatedAt UTCTime
      deriving Show
|]
