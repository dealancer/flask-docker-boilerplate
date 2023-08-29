#!/bin/bash

docker build -t flask-docker-boilerplate . && \

docker run \
--env-file .env \
-p 5000:5000 \
-v /var/log/flask-docker-boilerplate:/var/log/flask-docker-boilerplate \
--entrypoint /bin/sh \
-it flask-docker-boilerplate \
-c 'python -m waitress --host 0.0.0.0 --port 5000 src.app:app'
