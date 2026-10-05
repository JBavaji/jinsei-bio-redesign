# Stage 1: Build Serverpod Binary
FROM dart:stable AS build
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get
COPY . .
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
COPY --from=build /app/bin/main /app/bin/main
COPY --from=build /app/config /app/config

EXPOSE 8080
EXPOSE 8081

CMD ["/app/bin/main", "--mode", "staging", "--logging", "normal"]
