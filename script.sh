#!/bin/bash
# скрипт для учета расходов, база данных - data.txt
# Usage:
# 1) Занести трату: ./expencive.sh amount reason
# 2) История трат за месяц: ./expencive.sh history month

# проверка на наличие аргументов
if [[ ! -n $1 ]] || [[ ! -n $2 ]]
then
    echo "Аргументы не найдены"
    echo "Использование:"
    echo "1) Занести трату: $0 amount reason"
    echo "2) История трат за месяц: $0 history month"
    exit 0
fi

arg1=$1
arg2=$2

# 2 случая: arg1 = history или arg1 = числу
if [[ $arg1 == "history" ]]
then
    # проверка на наличие бд
    if [[ -e "data.txt" ]]
    then
        # ищем номер введенного месяца
        num_month=0
        case $arg2 in
            "январь") num_month=01;;
            "февраль") num_month=02;;
            "март") num_month=03;;
            "апрель") num_month=04;;
            "май") num_month=05;;
            "июнь") num_month=06;;
            "июль") num_month=07;;
            "август") num_month=08;;
            "сентябрь") num_month=09;;
            "октябрь") num_month=10;;
            "ноябрь") num_month=11;;
            "декабрь") num_month=12;;
        esac

        if [[ $num_month -gt 0 ]]
        then
            actual_year=$(date +"%Y")
            # проверяем есть ли траты в данном месяце
            count=$(grep "^$actual_year.$num_month" data.txt | wc -l)

            if [[ $count -gt 0 ]]
            then
                # считаем сумму, потраченную в данном месяце
                sum=0
                while read line
                do
                    amount=$(echo $line | awk '{print $3}')
                    sum=$(($sum+$amount))
                done < data.txt

                echo "В месяце $arg2 вы потратили - $sum руб."
                # выводим построчно все подходящие даты (по году и месяцу)
                grep "^$actual_year.$num_month" data.txt
            else
                echo "В месяце $arg2 вы не совершали трат"
                exit 0
            fi
        else
            echo "Месяц не корректный, попробуйте еще раз"
            exit 0
        fi
    else
        echo "Трат не найдено!"
        echo "Используйте команду для добавления трат:"
        echo "$0 amount reason"
        exit 0
    fi

else
    # проверяем корректность суммы (должна быть числом)
    if [[ $arg1 =~ ^[0-9]+$ ]]
    then
        date=$(date +"%Y-%m-%d") # получение актуальной даты

        # запись траты в файл data.txt
        echo "$date - $arg1 руб. на $arg2" >> data.txt
        echo "Трата успешно записана в файл"
    else
        echo "Некорректная сумма"
        exit 0
    fi
fi
