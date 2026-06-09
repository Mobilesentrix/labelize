FROM rust:slim-bullseye AS builder
WORKDIR /app

COPY . .

RUN cargo build --features=cli --features=serve --release

FROM debian:bookworm-slim
WORKDIR /app

COPY --from=builder /app/target/release/labelize /app/

CMD ["/app/labelize"]