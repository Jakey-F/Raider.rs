FROM rust:latest as builder

WORKDIR /usr/src/raider
COPY . .
RUN cargo build --release

FROM rust:alpine

WORKDIR /usr/raider
COPY --from=builder /usr/src/raider/target/release/raider raider

CMD [ "./raider" ]