FROM caddy:builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare

ARG VERSION

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy