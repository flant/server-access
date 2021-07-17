FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates gcc libc6-dev curl build-essential libsqlite3-dev
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/rustup
RUN sh /tmp/rustup -y --no-modify-path --profile minimal --default-toolchain 1.53.0

