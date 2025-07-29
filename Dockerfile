FROM dunglas/mercure

# Définir la clé JWT directement ici (à éviter en production !)

# Origines autorisées pour publier/souscrire
ENV MERCURE_PUBLISH_ALLOWED_ORIGINS="*"
ENV MERCURE_SUBSCRIBE_ALLOWED_ORIGINS="*"
ENV MERCURE_CORS_ALLOWED_ORIGINS="*"

# Optionnel : tu peux désactiver l'HTTPS forcé (utile pour Render en HTTP derrière HTTPS)
ENV SERVER_NAME=":"

CMD ["caddy", "run","--jwt-key=${MERCURE_PUBLISHER_JWT_KEY}", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile","--cors-allowed-origins=*"]
