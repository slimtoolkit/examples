#!/usr/bin/env bash

docker run -it --rm -p 8222:80 --env SECRET_KEY=insecure_secret_key --env DATABASE_URL=sqlite:///db.sqlite3 ubuntu-com.slim
