# Usamos la imagen oficial de n8n
FROM n8nio/n8n:latest

# Exponemos el puerto por defecto
EXPOSE 5678

# Comando de inicio
CMD ["n8n", "start"]