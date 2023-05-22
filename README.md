# Скрипт для учета расходов

<a href="https://github.com/agent-yandex/bash-finance-script/actions">
  <img alt="Tests Passing" src="https://img.shields.io/badge/Test-passing-brightgreen?logo=github&style=flat" />
</a>
<a href="https://github.com/agent-yandex/bash-finance-script/graphs/contributors">
  <img alt="Tests Passing" src="https://img.shields.io/badge/contributors-2-brightgreen?style=flat" />
</a>

Скрипт написан на bash и имеет небольшой функционал. Основная задача - практика в работе с файлами и парсингом аргументов.

## Запуск

Склонируйте репозиторий и зайдите в терминал, команды для запуска:
```
chmod +x script.sh
./script.sh
```

## Использование

Программа может работать в 2-ух режимах:
1. Режим занесения трат
2. Режим просмотра истории трат

**Чтобы занести трату, используйте команду:**
```
./script.sh amount reason
# пример команды
./script 500 продукты
```

**Для просмотра истории используйте команду:**
```
./script.sh history month
# пример команды
./script.sh history апрель # выведет все траты в апреле текущего года
```
