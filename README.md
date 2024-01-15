# Caddy

[![Version](https://img.shields.io/docker/v/douglasparker/caddy-cloudflare?style=flat-square&sort=semver)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![Docker Pulls](https://img.shields.io/docker/pulls/douglasparker/caddy-cloudflare?style=flat-square)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![Image Size](https://img.shields.io/docker/image-size/douglasparker/caddy-cloudflare?style=flat-square)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![License](https://img.shields.io/github/license/douglasparker/caddy-cloudflare?style=flat-square)](https://github.com/douglasparker/caddy-cloudflare/blob/main/LICENSE.md)

A Caddy docker image built with useful Caddy modules.

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
  --publish 443:443/tcp \
  --publish 443:443/udp \
  --restart=unless-stopped \
  registry.douglasparker.dev/caddy/caddy:latest
```

### Docker Compose

```yaml
services:
  caddy:
    image: registry.douglasparker.dev/caddy/caddy:latest
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
      - "443:443/tcp"
      - "443:443/udp"
    restart: unless-stopped
```

## Modules

### Cloudflare DNS

**Caddyfile:** (Global configuration)

```conf
{
	email {env.CLOUDFLARE_EMAIL}
	acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
}
```

**Caddyfile:** (Per-site configuration)

```conf
example.com {
	tls {env.CLOUDFLARE_EMAIL} { 
		dns cloudflare {env.CLOUDFLARE_API_TOKEN}
	}
}
```
