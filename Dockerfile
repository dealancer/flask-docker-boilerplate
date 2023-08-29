FROM python:3.11-slim

RUN pip install pipenv

WORKDIR /app

COPY Pipfile .
COPY Pipfile.lock .
ENV PIPENV_VENV_IN_PROJECT=1
RUN pipenv sync --system

COPY static static
COPY src src


CMD ["sh", "-c" , "python -m flask --app src/app.py run --host 0.0.0.0 --debug"]
