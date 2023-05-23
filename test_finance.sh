#!/bin/bash

echo "Запущен тест скрипта для управления финансами"

if [[ -f data.txt ]]
then
    rm data.txt
fi

# тест 1
result=$(./script.sh history май)
expected="Трат не найдено!
Используйте команду для добавления трат:
./script.sh amount reason"

if [[ $result == $expected ]]
then
    echo "Тест 1 пройден"
else
    echo "Тест 1 провален"
    exit 1
fi

# тест 2
result=$(./script.sh 500 продукты)
expected="Трата успешно записана в файл"

if [[ $result == $expected ]]
then
    echo "Тест 2 пройден"
else
    echo "Тест 2 провален"
    exit 2
fi

# тест 3
result=$(./script.sh аа вв)
expected="Некорректная сумма"

if [[ $result == $expected ]]
then
    echo "Тест 3 пройден"
else
    echo "Тест 3 провален"
    exit 2
fi

# тест 4
task=$(./script.sh 3000 телефон)
result=$(./script.sh history май)
expected="В месяце май вы потратили - 3500 руб.
2023-05-23 - 500 руб. на продукты
2023-05-23 - 3000 руб. на телефон"

if [[ $result == $expected ]]
then
    echo "Тест 4 пройден"
else
    echo "Тест 4 провален"
    exit 2
fi

rm data.txt
