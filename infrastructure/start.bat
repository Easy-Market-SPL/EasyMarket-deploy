@echo off

:: Verificar si los archivos existen
if not exist ".env.back" (
    echo El archivo .env.back no existe.
    exit /b 1
)
if not exist ".env.feats" (
    echo El archivo .env.feats no existe.
    exit /b 1
)
if not exist ".env.front" (
    echo El archivo .env.front no existe.
    exit /b 1
)

:: Concatenar los archivos .env
type .env.back .env.front .env.feats > .env

:: Ejecutar docker compose con el .env creado
docker-compose --env-file .env up --build -d

:: Eliminar el archivo .env después de ejecutar docker-compose
del .env

echo Docker Compose se ejecutó con el archivo .env generado y el archivo .env ha sido eliminado.
