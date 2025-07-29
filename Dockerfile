FROM dunglas/mercure
WORKDIR /app
COPY --from=dunglas/mercure /usr/local/bin/mercure /app/
CMD ["/app/mercure", "--jwt-key=secret-key", "--addr=:8080", "--allow-anonymous"]