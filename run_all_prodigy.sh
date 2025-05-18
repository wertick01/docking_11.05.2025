#!/bin/bash

# Файл вывода
OUTPUT="prodigy_summary.csv"
echo "Filename,DissociationConstant(M)" > "$OUTPUT"

# Обработка всех .pdb файлов
for pdb in *.pdb; do
    echo "Running prodigy on $pdb..."
    
    # Захватываем вывод prodigy
    result=$(prodigy "$pdb")

    # Извлекаем строку с константой диссоциации
    kd=$(echo "$result" | grep "Predicted dissociation constant" | awk -F':' '{print $2}' | xargs)

    # Добавляем в CSV
    echo "$pdb,$kd" >> "$OUTPUT"
done

echo "Готово. Результаты сохранены в $OUTPUT"

