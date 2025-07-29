FROM dunglas/mercure
CMD ["sh", "-c", "find / -name mercure -type f && /app/mercure --jwt-key=${JWT_KEY} --addr=:8080 --allow-anonymous"]