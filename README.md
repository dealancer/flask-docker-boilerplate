# flask-docker-boilerplate

This project is a simple flask app wrapped in the Docker container. You can spin off development of your project with this boilerplate. This project uses Pipenv to manage Python packages.

## Running

1. Build Docker image:
    ```
    docker build -t flask-docker-boilerplate .
    ```

2. Create log directory and assign permissions if neccessary:
    ```
    mkdir /var/log/flask-docker-boilerplate
    ```

3. Edit `.env` file to enable logging.

4. Run Docker container:
    ```
    docker run \
    --env-file .env \
    -p 5000:5000 \
    -v /var/log/flask-docker-boilerplate:/var/log/flask-docker-boilerplate \
    -v $PWD/src:/app/src \
    -v $PWD/static:/app/static \
    -it flask-docker-boilerplate
    ```

Alternatively you can use the following script to rebuild and run Docker container:
```
./run-flask.sh
```

## Running a production server

To run a production server use the following command:
```
docker run \
--env-file .env \
-p 5000:5000 \
-v /var/log/flask-docker-boilerplate:/var/log/flask-docker-boilerplate \
--entrypoint /bin/sh \
-it flask-docker-boilerplate \
-c 'python -m waitress --host 0.0.0.0 --port 5000 src.app:app'
```

You can also rebuild Docker container and run a production server with this command:
```
./run-waitress.py
```
