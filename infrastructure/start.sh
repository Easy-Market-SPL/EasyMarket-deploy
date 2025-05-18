#!/bin/bash

# Verificar si los archivos existen
if [[ ! -f .env.back || ! -f .env.feats || ! -f .env.front ]]; then
  echo "Uno o más archivos .env.back, .env.feats o .env.front no existen. Asegúrate de que todos los archivos estén presentes."
  exit 1
fi

# Concatenar los archivos .env
cat .env.back .env.feats .env.front > .env

# Ejecutar docker compose con el .env creado
docker-compose --env-file .env up --build -d

# Eliminar el archivo .env después de ejecutar docker-compose
rm .env

echo "Docker Compose se ejecutó con el archivo .env generado y el archivo .env ha sido eliminado."
