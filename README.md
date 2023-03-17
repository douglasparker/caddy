# caddy-cloudflare

[![Version](https://img.shields.io/docker/v/douglasparker/caddy-cloudflare?style=flat-square&sort=semver)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![Docker Pulls](https://img.shields.io/docker/pulls/douglasparker/caddy-cloudflare?style=flat-square)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![Image Size](https://img.shields.io/docker/image-size/douglasparker/caddy-cloudflare?style=flat-square)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![License](https://img.shields.io/github/license/douglasparker/caddy-cloudflare?style=flat-square)](https://github.com/douglasparker/caddy-cloudflare/blob/main/LICENSE.md)

Caddy docker image with the Cloudflare DNS provider module.

## Usage

### Docker Run

```bash
docker run --detach \
  --name caddy \
  --env CLOUDFLARE_EMAIL=<email> \
  --env CLOUDFLARE_API_TOKEN=<api-token> \
  --env ACME_AGREE=true \
  --volume ./data:/data \
  --volume ./config:/config \
  --volume ./Caddyfile:/etc/caddy/Caddyfile \
  --publish 80:80/tcp \
  --publish 443:443/tcp \
  --publish 443:443/udp \
  --restart=unless-stopped \
  ghcr.io/douglasparker/caddy-cloudflare:latest
```

### Docker Compose

```yaml
services:
  caddy:
    image: ghcr.io/douglasparker/caddy-cloudflare:latest
    container_name: caddy
    environment:
      - CLOUDFLARE_EMAIL=<email>
      - CLOUDFLARE_API_TOKEN=<api-token>
      - ACME_AGREE=true
    volumes:
      - ./data:/data
      - ./config:/config
      - ./Caddyfile:/etc/caddy/Caddyfile
    ports:
      - "80:80/tcp"
      - "443:443/tcp"
      - "443:443/udp"
    restart: unless-stopped
```

### Caddyfile

*Global configuration:*

```conf
{
    email {env.CLOUDFLARE_EMAIL}
    acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
}
```

*Per-site configuration:*

```conf
tls {env.CLOUDFLARE_EMAIL} { 
  dns cloudflare {env.CLOUDFLARE_API_TOKEN}
}
```