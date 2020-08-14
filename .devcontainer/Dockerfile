FROM bitwalker/alpine-elixir-phoenix:latest AS build

RUN \
    apk update && \
    apk --no-cache --update add \
    curl \
    ncurses \
    openssl \
    postgresql-client

EXPOSE 4000