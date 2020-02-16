FROM haskell:7.10

RUN cabal update
WORKDIR /opt/service

ADD ./service/server.cabal /opt/service/server.cabal
RUN cabal install --only-dependencies -j4

ADD ./service /opt/service
RUN cabal install

ENV PATH /root/.cabal/bin:$PATH

EXPOSE 1300
CMD ["server"]
