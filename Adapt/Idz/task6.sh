
input_file="input.txt"
output_file="output.txt"

echo "Создание файла input.txt..."
cat > "$input_file" << 'EOF'
Это первая строка файла input.txt
Это вторая строка
Это третья строка
Bash - мощный инструмент для работы с системой
Перенаправление ввода/вывода - важная концепция
Символ > перенаправляет вывод в файл
Символ < перенаправляет ввод из файла
Символ >> добавляет вывод в конец файла
Символ 2> перенаправляет стандартный поток ошибок
EOF

echo "✓ Файл создан"
echo ""

echo "1. Чтение файла input.txt:"
echo "-----------------------------------------------------------"
cat "$input_file"

echo ""
echo "2. Подсчёт строк и перенаправление в output.txt:"
echo "-----------------------------------------------------------"
wc -l "$input_file" > "$output_file"
echo "✓ Результат записан в output.txt"
echo ""
echo "Содержимое output.txt:"
cat "$output_file"

echo ""
echo "3. Примеры перенаправления:"
echo "-----------------------------------------------------------"

demo_file="demo_output.txt"

echo "A) Перенаправление вывода (>):"
echo "Новая строка" > "$demo_file"
echo "Содержимое: $(cat $demo_file)"

echo ""
echo "B) Добавление в конец (>>):"
echo "Дополнительная строка" >> "$demo_file"
cat "$demo_file"

echo ""
echo "C) Перенаправление ввода (<):"
word_count=$(wc -w < "$input_file")
echo "Количество слов: $word_count"

echo ""
echo "D) Перенаправление ошибок (2>):"
error_file="errors.txt"
ls несуществующий_файл 2> "$error_file"
echo "Ошибка в файле errors.txt:"
cat "$error_file"

echo ""
echo "E) Конвейер (pipe):"
cat "$input_file" | grep 'Bash'

echo ""
echo "F) Подавление вывода (/dev/null):"
ls несуществующий_файл 2> /dev/null
echo "Ошибка подавлена"

