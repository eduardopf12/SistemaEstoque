#!/bin/bash

APP_NAME="Estoque"
APP_DIR="/var/www/estoque"
DLL_NAME="Estoque.dll"
SERVICE_NAME="estoque"
PORT=5000
IP="10.168.11.156"

echo "======================================"
echo "🚀 DEPLOY SISTEMA ESTOQUE"
echo "Servidor: $IP"
echo "======================================"

if [ -z "$1" ]; then
  echo "❌ Informe o ambiente: dev | test | prod"
  exit 1
fi

ENV=$1

case $ENV in
  dev)
    ASP_ENV="Development"
    ;;
  test)
    ASP_ENV="Test"
    ;;
  prod)
    ASP_ENV="Production"
    ;;
  *)
    echo "❌ Ambiente inválido. Use: dev | test | prod"
    exit 1
    ;;
esac

echo "🌎 Ambiente selecionado: $ASP_ENV"

cd $APP_DIR || exit 1

echo "🛑 Parando serviço (se existir)..."
sudo systemctl stop $SERVICE_NAME 2>/dev/null

echo "🔪 Liberando porta $PORT..."
PIDS=$(sudo lsof -t -i:$PORT)
if [ -n "$PIDS" ]; then
  sudo kill -9 $PIDS
  echo "✔️ Porta liberada"
else
  echo "✔️ Porta já estava livre"
fi

echo "🔐 Ajustando permissões..."
sudo chown -R www-data:www-data $APP_DIR
sudo chmod -R 755 $APP_DIR

echo "🌎 Definindo variáveis de ambiente..."
export ASPNETCORE_ENVIRONMENT=$ASP_ENV
export ASPNETCORE_URLS=http://0.0.0.0:$PORT

echo "♻️ Recarregando systemd..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

if [ "$ENV" = "prod" ]; then
  echo "▶️ Subindo via systemd (PRODUÇÃO)..."
  sudo systemctl start $SERVICE_NAME
  sudo systemctl status $SERVICE_NAME --no-pager
else
  echo "▶️ Subindo em modo MANUAL ($ASP_ENV)..."
  dotnet $DLL_NAME
fi

echo "======================================"
echo "✅ DEPLOY FINALIZADO"
echo "🌐 Acesse: http://$IP:$PORT"
echo "======================================"
