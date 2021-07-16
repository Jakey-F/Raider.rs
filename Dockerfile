FROM rust:1.40 as builder

WORKDIR /usr/src/raider
COPY . .
RUN cargo build --release

FROM rust:alpine

WORKDIR /usr/raider
COPY --from=builder /usr/src/raider/target/release/raider raider

CMD [ "./raider" ]