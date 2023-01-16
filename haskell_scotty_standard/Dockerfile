FROM haskell:9.4

RUN cabal update
WORKDIR /opt/service

ADD ./service /opt/service
RUN cabal install -j$(nproc)

ENV PATH /root/.cabal/bin:$PATH

EXPOSE 1300
CMD ["server"]
