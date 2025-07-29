FROM dunglas/mercure
CMD ["./mercure", "--jwt-key='secret-key'", "--addr=':8080'", "--allow-anonymous"]