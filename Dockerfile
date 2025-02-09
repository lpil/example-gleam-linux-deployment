FROM erlang:27.1.1.0-alpine AS build
COPY --from=ghcr.io/gleam-lang/gleam:v1.8.0-erlang-alpine /bin/gleam /bin/gleam
COPY . /app/
RUN cd /app && gleam export erlang-shipment

FROM erlang:27.1.1.0-alpine
RUN \
  addgroup --system webapp && \
  adduser --system webapp -g webapp   
COPY --from=build /app/build/erlang-shipment /app
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["run"]
