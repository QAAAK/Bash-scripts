#!/!/bin/bash


HDFS_SOURCE_DIR="/user/hadoop/data"
LOCAL_TARGET_DIR="./local_data"
LOG_FILE="hdfs_download_$(date +%Y%m%d_%H%M%S).log"


log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}


if [ ! -d "$LOCAL_TARGET_DIR" ]; then
    log_message "Создаю локальную директорию: $LOCAL_TARGET_DIR"
    mkdir -p "$LOCAL_TARGET_DIR" || {
        log_message "Ошибка: не удалось создать директорию $LOCAL_TARGET_DIR"
        exit 1
    }
fi

log_message "Получаю список файлов из HDFS: $HDFS_SOURCE_DIR"
hdfs dfs -ls "$HDFS_SOURCE_DIR" 2>/dev/null | tail -n +2 | \
    while read -r permissions blocks size user group modification_date modification_time filename; do
        # Пропускаем директории и пустые строки
        if [[ "$permissions" == d* ]] || [[ -z "$filename" ]]; then
            continue
        fi


        base_filename=$(basename "$filename")
        local_file_path="$LOCAL_TARGET_DIR/$base_filename"

        log_message "Скачиваю файл: $filename -> $local_file_path"


        if hdfs dfs -get "$filename" "$local_file_path"; then
            log_message "Успешно скачан: $base_filename"
        else
            log_message "ОШИБКА при скачивании: $base_filename"
        fi
    done

log_message "Процесс загрузки завершён."
