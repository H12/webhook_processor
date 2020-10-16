FROM elixir:1.10

ARG ENV=prod

ENV MIX_ENV=$ENV

WORKDIR /opt/build

ADD ./bin/release ./bin/release

CMD ["bin/release", $ENV]
