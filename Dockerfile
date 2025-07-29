FROM dunglas/mercure

ENV SERVER_NAME=":80, :443"

# Les variables suivantes doivent être injectées dynamiquement à l’exécution (via .env ou Render)
# Ne pas définir les clés JWT dans le Dockerfile pour des raisons de sécurité.

# Ajout des directives supplémentaires
ENV MERCURE_EXTRA_DIRECTIVES="\
    cors_origins *\n\
    cors_allowed_headers \"Content-Type,Authorization\"\n\
    cors_exposed_headers \"Link\"\n\
    cors_credentials on\n\
    anonymous\n\
    publish_origins *\n\
    demo\
    "

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
