#!/bin/bash

docker build -t flask-docker-boilerplate . && \

docker run \
--env-file .env \
-p 5000:5000 \
-v /var/log/flask-docker-boilerplate:/var/log/flask-docker-boilerplate \
-v $PWD/src:/app/src \
-v $PWD/static:/app/static \
-it flask-docker-boilerplate
