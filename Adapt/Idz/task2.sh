echo "1. Текущие значения переменной PATH:"
echo "-----------------------------------------------------------"
echo "$PATH" | tr ':' '\n' | nl
echo ""

if [ -z "$1" ] ; then
    echo "Аргумент не передан."
    else
    new_dir = "$1"

    if [ -d "$new_dir" ] ; then
        echo "Добавление директории '$new_dir' в PATH..."
        export PATH = "$PATH:$new_dir"
        echo ""
        echo "2. Обновленная переменная PATH:"
        echo "-----------------------------------------------------------"
        echo "$PATH" | tr ':' '\n' | nl
        echo ""
        echo "✓ Директория добавлена в PATH (временно)"
        else
        echo "Директория '$new_dir' не существует"
    fi
fi

echo ""
echo "Для постоянного изменения добавьте в ~/.bashrc или ~/.zshrc:"
echo "export PATH = \"\$PATH:$new_dir\""