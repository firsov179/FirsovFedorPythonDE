
echo "1. Список файлов в текущей директории:"
echo "-----------------------------------------------------------"
for item in *; do
    if [ -d "$item" ]; then
        echo "$item - каталог"
    elif [ -f "$item" ]; then
        echo "$item - обычный файл"
    elif [ -L "$item" ]; then
        echo "$item - символическая ссылка"
    elif [ -b "$item" ]; then
        echo "$item - блочное устройство"
    elif [ -c "$item" ]; then
        echo "$item - символьное устройство"
    elif [ -p "$item" ]; then
        echo "$item - именованный канал"
    elif [ -S "$item" ]; then
        echo "$item - сокет"
    else
        echo "$item - неизвестный тип"
    fi
done
echo ""

echo "2. Проверка наличия файла:"
echo "-----------------------------------------------------------"
if [ -z "$1" ]; then
    echo "Аргумент не передан."
else
    if [ -e "$1" ]; then
        echo "Файл '$1' найден"
        if [ -f "$1" ]; then
            echo "Тип: обычный файл"
        elif [ -d "$1" ]; then
            echo "Тип: каталог"
        fi
    else
        echo "Файл '$1' НЕ найден"
    fi
fi
echo ""

echo "3. Информация о файлах:"
echo "-----------------------------------------------------------"
for item in *; do
    if [ -e "$item" ]; then
        permissions=$(ls -ld "$item" | awk '{print $1}')
        echo "Файл: $item | Права: $permissions"
    fi
done

