ARG VERSION

FROM caddy:builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy