# ![RealWorld Example App](logo.png)

> ### Haskell/SnapFramework codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld-example-apps) spec and API.

This codebase was created to demonstrate a fully fledged fullstack application built with **Haskell/SnapFramework** including CRUD operations, authentication, routing, pagination, and more.

We've gone to great lengths to adhere to the **Haskell/SnapFramework** community styleguides & best practices.

For more information on how to this works with other frontends/backends, head over to the [RealWorld](https://github.com/gothinkster/realworld) repo.


# How it works
 > TODO
# Getting Started

## Installation

Install [Stack](https://docs.haskellstack.org/en/stable/README/).

Install [PostgreSQL](https://www.postgresql.org/).

You can us well run docker-compose up db to run the included postgres container

Clone the repository and cd to repo

    git clone https://github.com/kigsmtua/haskell-snap-realworld-example-app.git

    cd haskell-snap-realworld-example-app

Install GHC

    stack setup

Install dependencies and build project

    stack build

Run project

    stack exec conduit

Alternatively, to watch file changes and run the tests automatically
    stack test --file-watch --coverage
