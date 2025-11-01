if [ -z "$1" ] ; then
    echo "Использование: $0 < директория > "
    exit 1
fi

target_dir = "$1"
log_file = "sort_log.txt"

if [ ! -d "$target_dir" ] ; then
    echo "Ошибка: директория '$target_dir' не найдена"
    exit 1
fi

images_dir = "${target_dir}/Images"
documents_dir = "${target_dir}/Documents"

mkdir -p "$images_dir"
mkdir -p "$documents_dir"

echo "$(date): Начало сортировки файлов в $target_dir" > > "$log_file"

image_count = 0
doc_count = 0

for file in "$target_dir"/* ; do
    if [ -f "$file" ] ; then
    filename = $(basename "$file")
    ext = "${filename##*.}"
    ext_lower = $(echo "$ext" | tr '[:upper:]' '[:lower:]')

    case "$ext_lower" in
    jpg | png | gif)
    mv "$file" "$images_dir/"
    echo "$(date): $filename - > Images/" > > "$log_file"
    echo "Изображение: $filename - > Images/"
    ((image_count++))
     ; ; 
    txt | pdf | docx)
    mv "$file" "$documents_dir/"
    echo "$(date): $filename - > Documents/" > > "$log_file"
    echo "Документ: $filename - > Documents/"
    ((doc_count++))
     ; ; 
    esac
fi
done

echo "$(date): Завершено. Изображений: $image_count, Документов: $doc_count" > > "$log_file"
echo "-----------------------------------------------------------"
echo "✓ Сортировка завершена"
echo "Изображений перемещено: $image_count"
echo "Документов перемещено: $doc_count"
echo ""
echo "Для автоматического запуска каждую ночь в 2:00 добавьте в cron:"
echo "crontab -e"
echo "0 2 * * * $(realpath $0) $target_dir"