#!/bin/sh
echo "Verificando permissões..."
mkdir -p /data/web/static /data/web/media
chown -R duser:duser /data/web
chmod -R 755 /data/web

echo "Iniciando servidor..."
exec "$@"

# O shell irá encerrar a execução do script quando um comando falhar
set -e

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  echo "🟡 Waiting for Postgres Database Startup ($POSTGRES_HOST $POSTGRES_PORT) ..." 
  sleep 2
done

echo "✅ Postgres Database Started Successfully ($POSTGRES_HOST:$POSTGRES_PORT)"

# python manage.py collectstatic --noinput
# python manage.py makemigrations --noinput
# python manage.py migrate --noinput
# python manage.py runserver 0.0.0.0:8000

collectstatic.sh
makemigrations.sh
migrate.sh
runserver.sh