#!/bin/bash

# Caminho do repositório do serviço Produto
REPO_DIR="C:/Users/mah_b/OneDrive/Área de Trabalho/petfriend_project/petfriends-produto"

# Nome do microserviço
SERVICE_NAME="petfriends_produto"

start_service() {
    echo "Iniciando o microserviço $SERVICE_NAME..."
    cd "$REPO_DIR" || exit
    docker-compose up -d
}

stop_service() {
    echo "Parando o microserviço $SERVICE_NAME..."
    cd "$REPO_DIR" || exit
    docker-compose stop
}

rebuild_service() {
    echo "Reconstruindo o microserviço $SERVICE_NAME..."
    cd "$REPO_DIR" || exit
    docker-compose up --build -d
}

logs_service() {
    echo "Exibindo os logs do microserviço $SERVICE_NAME..."
    cd "$REPO_DIR" || exit
    docker-compose logs -f
}

case "$1" in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    rebuild)
        rebuild_service
        ;;
    logs)
        logs_service
        ;;
    *)
        echo "Uso: $0 {start|stop|rebuild|logs}"
        exit 1
esac
