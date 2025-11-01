echo "Введите число:"
read -r number

if ! [[ "$number" = ~ ^-?[0-9]+$ ]] ; then
    echo "Ошибка: введено не число!"
    exit 1
fi

echo ""
echo "1. Проверка числа:"
echo "-----------------------------------------------------------"

if [ "$number" -gt 0 ] ; then
    echo "Число $number является ПОЛОЖИТЕЛЬНЫМ"
    is_positive = true
    elif [ "$number" -lt 0 ] ; then
        echo "Число $number является ОТРИЦАТЕЛЬНЫМ"
        is_positive = false
        else
        echo "Число равно НУЛЮ"
        is_positive = false
fi

echo ""

if [ "$is_positive" = true ] ; then
    echo "2. Подсчёт с помощью цикла FOR:"
    echo "-----------------------------------------------------------"
    echo -n "Числа: "
    for ((i = 1 ; i < = number ; i++)) ; do
        if [ $i -eq "$number" ] ; then
            echo "$i"
            else
            echo -n "$i, "
        fi
    done

    echo ""
    echo "3. Подсчёт с помощью цикла WHILE:"
    echo "-----------------------------------------------------------"
    echo -n "Числа: "
    i = 1
    while [ $i -le "$number" ] ; do
        if [ $i -eq "$number" ] ; then
            echo "$i"
            else
            echo -n "$i, "
        fi
        ((i++))
    done
    echo ""
fi