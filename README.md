# caddy-cloudflare

[![Version](https://img.shields.io/docker/v/douglasparker/caddy-cloudflare?style=flat-square&sort=semver)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![Docker Pulls](https://img.shields.io/docker/pulls/douglasparker/caddy-cloudflare?style=flat-square)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![Image Size](https://img.shields.io/docker/image-size/douglasparker/caddy-cloudflare?style=flat-square)](https://hub.docker.com/r/douglasparker/caddy-cloudflare)
[![License](https://img.shields.io/github/license/douglasparker/caddy-cloudflare?style=flat-square)](https://github.com/douglasparker/caddy-cloudflare/blob/main/LICENSE.md)

Caddy docker image with the Cloudflare DNS provider module.

## Usage

### Docker Run

```docker
docker run -it --name caddy \
  -p 80:80/tcp \
  -p 443:443 \
  -v ./data:/data \
  -v ./config:/config \
  -v ./Caddyfile:/etc/caddy/Caddyfile \
  -e CLOUDFLARE_EMAIL=me@example.com \
  -e CLOUDFLARE_API_TOKEN=12345 \
  -e ACME_AGREE=true \
  douglasparker/caddy-cloudflare 
```

### Docker Compose