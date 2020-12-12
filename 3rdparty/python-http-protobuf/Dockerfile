FROM archlinux:latest

RUN pacman -Sy --noconfirm \
    python-pip \
    python-protobuf \
    protobuf \
    git

COPY conf /code/conf
COPY bin  /code/bin
COPY src  /code/src
COPY test /code/test

WORKDIR /code

# RUN bash bin/requirements.freeze.sh

RUN protoc -I=src --python_out=src src/*.proto
RUN pip install -r conf/requirements.git.txt
RUN pip install --require-hashes -r conf/requirements.frozen.txt
CMD python test/test.py
