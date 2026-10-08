# Stage 1: Build Serverpod Binary
FROM dart:stable AS build
WORKDIR /app

# Copy root workspace pubspec.yaml and package pubspecs for Dart 3.5 workspace resolution
COPY pubspec.yaml ./
COPY jinsei_bio_redesign_server/pubspec.* ./jinsei_bio_redesign_server/
COPY jinsei_bio_redesign_client/pubspec.* ./jinsei_bio_redesign_client/
COPY jinsei_bio_redesign_flutter/pubspec.* ./jinsei_bio_redesign_flutter/

WORKDIR /app/jinsei_bio_redesign_server
RUN dart pub get

COPY jinsei_bio_redesign_server /app/jinsei_bio_redesign_server
COPY jinsei_bio_redesign_client /app/jinsei_bio_redesign_client

RUN dart compile exe bin/main.dart -o bin/main

# Stage 2: Minimal Production Image
FROM debian:bookworm-slim
WORKDIR /app

# Install SSL certificates & curl
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy Serverpod Compiled Binary & Configs
COPY --from=build /app/jinsei_bio_redesign_server/bin/main /app/bin/main
COPY --from=build /app/jinsei_bio_redesign_server/config /app/config

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

CMD ["/app/bin/main", "--mode", "staging", "--logging", "normal"]
