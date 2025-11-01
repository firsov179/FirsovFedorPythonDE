greet() {
    local name = "$1"
    if [ -z "$name" ] ; then
        echo "Привет, Гость!"
        else
        echo "Привет, $name!"
    fi
}

sum_numbers() {
    local num1 = "$1"
    local num2 = "$2"

    if ! [[ "$num1" = ~ ^-?[0-9]+(\.[0-9]+)?$ ]] | | ! [[ "$num2" = ~ ^-?[0-9]+(\.[0-9]+)?$ ]] ; then
        echo "Ошибка: оба аргумента должны быть числами!" > & 2
        return 1
    fi

    local result = $(echo "$num1 + $num2" | bc)
    echo "$result"
}

echo "1. Функция приветствия:"
echo "-----------------------------------------------------------"
greet "Василий"
greet "Мария"
greet

echo ""
echo "2. Функция суммирования:"
echo "-----------------------------------------------------------"
result = $(sum_numbers 15 27)
echo "15 + 27 = $result"

result = $(sum_numbers -10 45)
echo "-10 + 45 = $result"

result = $(sum_numbers 3.5 2.7)
echo "3.5 + 2.7 = $result"

echo ""
echo "3. Интерактивный режим:"
echo "-----------------------------------------------------------"
echo "Введите ваше имя:"
read -r user_name
greet "$user_name"

echo ""
echo "Введите первое число:"
read -r num1
echo "Введите второе число:"
read -r num2

result = $(sum_numbers "$num1" "$num2")
if [ $? -eq 0 ] ; then
    echo "Сумма $num1 и $num2 = $result"
fi