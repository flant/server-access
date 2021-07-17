#!/usr/bin/env bash

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit 2 ; pwd -P )"

docker build -f "$SCRIPTDIR"/Dockerfile -t rust:debian-jessie "$SCRIPTDIR"
mkdir -p /tmp/flantauthbuild
docker run --rm -v "$SCRIPTDIR":/app -v /tmp/flantauthbuild:/root/.cargo/registry -w /app rust:debian-jessie /bin/bash -c \
    "/root/.cargo/bin/cargo build --lib --release --features dynamic_paths && \
    strip -s target/release/libnss_flantauth.so"

mkdir -p "$SCRIPTDIR"/lib
cp "$SCRIPTDIR"/target/release/libnss_flantauth.so "$SCRIPTDIR"/lib/libnss_flantauth.so.2

if [[ $1 == "install" ]] ; then
  echo "Copy libnss_flantauth.so.2 to /lib/x86_64-linux-gnu/libnss_flantauth.so.2"
  cp "$SCRIPTDIR"/lib/libnss_flantauth.so.2 /lib/x86_64-linux-gnu/
fi
