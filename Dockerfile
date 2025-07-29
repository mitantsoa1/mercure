FROM dunglas/mercure AS builder

FROM alpine:3.18
WORKDIR /app
# Copie de l'exécutable depuis l'image officielle
COPY --from=builder /usr/bin/mercure /app/
# Installation des dépendances minimales
RUN apk add --no-cache libc6-compat
CMD ["/app/mercure", "--jwt-key=${JWT_KEY}", "--addr=:8080", "--allow-anonymous"]