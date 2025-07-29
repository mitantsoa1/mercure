FROM dunglas/mercure

# Installer envsubst (inclus dans gettext)
RUN apk add --no-cache gettext

ENV MERCURE_EXTRA_DIRECTIVES="\
    cors_origins *\n\
    cors_allowed_headers \"Content-Type,Authorization\"\n\
    cors_exposed_headers \"Link\"\n\
    cors_credentials on\n\
    anonymous\n\
    publish_origins *\n\
    demo\
    "

# Copie le template et le script d’entrée
COPY Caddyfile.template /etc/caddy/Caddyfile.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Définir les variables par défaut (Render remplacera avec ses propres valeurs)
ENV SERVER_NAME=":80, :443"

ENTRYPOINT ["/entrypoint.sh"]

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]