# hello-scotty
A simple haskell web app using scotty

To run:

`$ cabal run`

To build docker image

`% docker build -t hello-scotty .`

To run the application using docker:

`% docker run -i -t -p 3000:3000 hello-scotty`

To view the application in the browser:

`% open http://$(boot2docker ip):3000`
