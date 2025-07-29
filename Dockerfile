# Utilise l'image officielle Mercure
FROM dunglas/mercure

# Définir les variables d'environnement dynamiques par défaut
# Render assigne le port via la variable $PORT
ENV SERVER_NAME=: \
    MERCURE_PUBLISH_ALLOWED_ORIGINS=* \
    MERCURE_SUBSCRIBE_ALLOWED_ORIGINS=* \
    MERCURE_JWT_SECRET=YourJWTSecretHere \
    MERCURE_CORS_ALLOWED_ORIGINS=* \
    MERCURE_EXTRA_DIRECTIVES=""

# On redéfinit la commande d’entrée pour utiliser le port Render
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
