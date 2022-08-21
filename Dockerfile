FROM python:latest

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


RUN apt-get update && apt-get install -y netcat

RUN mkdir /src

WORKDIR /src

RUN pip install --upgrade pip

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY ./src /src

COPY .env .env

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/src/entrypoint.sh"]