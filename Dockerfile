FROM bitwalker/alpine-elixir-phoenix:latest AS build
ENV MIX_ENV=prod

# install mix dependencies
ADD mix.exs mix.lock ./
RUN mix do deps.get --only prod, deps.compile

# Same with npm deps
ADD assets/package.json assets/
RUN cd assets && \
    npm install --unsafe-perm -g elm@0.19.0-no-deps && \
    npm install

# Run frontend build, compile, and digest assets
ADD . .
RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix compile --warnings-as-errors && \
    mix phx.digest && \
    mix release --path ./build && \
    cp *.sh ./build


FROM alpine:latest
ENV HOME=/opt/app/

WORKDIR $HOME

RUN \
    apk update && \
    apk --no-cache --update add \
    ncurses \
    openssl \
    postgresql-client && \
    rm -rf /var/cache/apk/*


COPY --from=build ${HOME}build $HOME
RUN chown -R nobody: $HOME
USER nobody

ENTRYPOINT ["./bin/portishead"]
CMD ["start"]
