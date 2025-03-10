#!/bin/bash

# Параметры подключения
USER="your_username"             # Ваш логин
HOST="ftp.server.com"            # Адрес вашего FTP-сервера
REMOTE_DIR="dirs"                # Директория на сервере
FILE_NAME="your_file.txt"        # Имя файла для загрузки
LOCAL_DIR="/path/to/local/dir"   # Локальная директория для сохранения файла

# Проверка существования локальной директории
if [ ! -d "$LOCAL_DIR" ]; then
    mkdir -p "$LOCAL_DIR"
fi

# Команда для копирования файла
scp "$USER@$HOST:$REMOTE_DIR/$FILE_NAME" "$LOCAL_DIR"

# Проверка успешности выполнения команды
if [ $? -eq 0 ]; then
    echo "Файл успешно скопирован в $LOCAL_DIR"
else
    echo "Ошибка при копировании файла"
fi
