
docker build -t flask-docker-boilerplate .

docker run \
--env-file .env \
-p 5000:5000 \
-v /var/log/flask-docker-boilerplate:/var/log/flask-docker-boilerplate \
-it flask-docker-boilerplate