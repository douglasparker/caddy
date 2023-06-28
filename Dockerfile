ARG VERSION

FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${VERSION}

LABEL org.opencontainers.image.source https://github.com/douglasparker/caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy