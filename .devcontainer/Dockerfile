FROM bitwalker/alpine-elixir-phoenix:latest AS build

RUN \
    apk update && \
    apk --no-cache --update add \
    curl \
    inotify-tools \
    postgresql-client

EXPOSE 4000

