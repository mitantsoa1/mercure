FROM dunglas/mercure
CMD ["./mercure", "--jwt-key='your-secret-key'", "--addr=':80'", "--allow-anonymous"]