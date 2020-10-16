FROM elixir:1.10

ENV MIX_ENV=$ENV

WORKDIR /opt/build

ADD ./bin/release ./bin/release

CMD ["bin/release", $ENV]
