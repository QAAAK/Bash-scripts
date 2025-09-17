#!/bin/bash

LOG_FILE="/var/log/apt_cleanup.log"
echo "Очистка системы от неиспользуемых пакетов... $(date)" | tee -a "$LOG_FILE"

# Удаление неиспользуемых зависимостей
sudo apt autoremove -y | tee -a "$LOG_FILE"

# Очистка кэша пакетов
sudo apt clean | tee -a "$LOG_FILE"

# Очистка устаревших пакетов локального кэша
sudo apt autoclean | tee -a "$LOG_FILE"

echo "Очистка завершена." | tee -a "$LOG_FILE"
