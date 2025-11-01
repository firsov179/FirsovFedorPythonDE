if [ -z "$1" ] ; then
    echo "Использование: $0 < директория > "
    exit 1
fi

source_dir = "$1"
backup_dir = "${source_dir}_backup"
date_stamp = $(date +%Y%m%d_%H%M%S)
log_file = "backup_log_${date_stamp}.txt"

if [ ! -d "$source_dir" ] ; then
    echo "Ошибка: директория '$source_dir' не найдена"
    exit 1
fi

echo "Создание резервной копии директории: $source_dir"
echo "Дата: $(date)" | tee "$log_file"
echo "-----------------------------------------------------------"

mkdir -p "$backup_dir"

file_count = 0
for file in "$source_dir"/* ; do
    if [ -f "$file" ] ; then
    filename = $(basename "$file")
    name = "${filename%.*}"
    ext = "${filename##*.}"

    if [ "$name" = "$ext" ] ; then
        backup_name = "${name}_${date_stamp}"
        else
        backup_name = "${name}_${date_stamp}.${ext}"
    fi

    cp "$file" "$backup_dir/$backup_name"
    echo "Скопирован: $filename - > $backup_name" | tee -a "$log_file"
    ((file_count++))
fi
done

echo "-----------------------------------------------------------"
echo "Резервное копирование завершено успешно" | tee -a "$log_file"
echo "Скопировано файлов: $file_count" | tee -a "$log_file"
echo "Директория с копиями: $backup_dir" | tee -a "$log_file"
echo "Файл лога: $log_file" | tee -a "$log_file"