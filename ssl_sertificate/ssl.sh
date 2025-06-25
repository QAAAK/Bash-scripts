#!/bin/bash

# Проверка, был ли передан аргумент скрипту
if [ -z "$1" ]
then
    echo "Не указан хост. Использование: $0 hostname"
    exit 1
fi

# Имя хоста получаем из первого аргумента скрипта
HOSTNAME=$1

# Получение сертификата с помощью OpenSSL
echo | openssl s_client -servername $HOSTNAME -connect $HOSTNAME:443 2>/dev/null | openssl x509 -text > $HOSTNAME.pem

# Изменение прав на файл
chmod 777 $HOSTNAME.pem
