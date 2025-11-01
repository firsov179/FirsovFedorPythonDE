log_file="/tmp/process_demo_$$.log"
> "$log_file"

echo "1. Запуск процессов sleep в фоновом режиме:"
echo "-----------------------------------------------------------"

echo "Запускаем: sleep 30..."
(sleep 30; echo "Процесс sleep 30 завершён" >> "$log_file") &
pid1=$!
echo "✓ Процесс 1 запущен в фоне (PID: $pid1)"

sleep 1

echo "Запускаем: sleep 45..."
(sleep 45; echo "Процесс sleep 45 завершён" >> "$log_file") &
pid2=$!a
echo "✓ Процесс 2 запущен в фоне (PID: $pid2)"

sleep 1

echo "Запускаем: sleep 60..."
(sleep 60; echo "Процесс sleep 60 завершён" >> "$log_file") &
pid3=$!
echo "✓ Процесс 3 запущен в фоне (PID: $pid3)"

echo ""
echo "2. Фоновые задачи (jobs):"
echo "-----------------------------------------------------------"
jobs

echo ""
echo "3. Информация о процессах (ps):"
echo "-----------------------------------------------------------"
ps aux | grep "sleep 30\|sleep 45\|sleep 60" | grep -v grep || echo "Процессы sleep найдены"

echo ""
echo "4. Завершение процесса:"
echo "-----------------------------------------------------------"
echo "Завершаем процесс с PID $pid2..."
kill $pid2 2>/dev/null
wait $pid2 2>/dev/null
echo "✓ Процесс $pid2 завершён"

echo ""
jobs

echo ""
echo "5. Завершение оставшихся процессов:"
echo "-----------------------------------------------------------"
kill $pid1 2>/dev/null
kill $pid3 2>/dev/null
wait $pid1 2>/dev/null
wait $pid3 2>/dev/null
echo "✓ Все процессы завершены"

rm -f "$log_file"

