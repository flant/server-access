#!/usr/bin/env bash

docker build -f Dockerfile -t rust:debian-jessie .
docker run --rm -v $(pwd):/app -w /app rust:debian-jessie /root/.cargo/bin/cargo build --lib --release --features dynamic_paths
strip -s target/release/libnss_flantauth.so