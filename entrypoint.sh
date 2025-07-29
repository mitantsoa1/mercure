#!/bin/sh

set -e

# Remplace les variables dans le template
envsubst < /etc/caddy/Caddyfile.template > /etc/caddy/Caddyfile

# Lance Caddy
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
