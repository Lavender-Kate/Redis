#!/bin/bash

# Установка Redis из официального пакетного менеджера apt
sudo apt update
sudo apt install redis-server

# Запуск сервера редис
sudo systemctl start redis-server
sudo systemctl enable redis-server

# Вывод установленной версии
redis-server --version

# Смена хоста 127.0.0.1 на 0.0.0.0 для внешних подключений
sudo sed -i -e "s/bind 127.0.0.1 ::1/bind 0.0.0.0 ::1/g" /etc/redis/redis.conf

# Увеличение прав пользователя
sudo sed -i -e "s/supervised no/supervised systemd/g" /etc/redis/redis.conf

# Установка пароля для аутентификации
sudo sed -i -e "s/# requirepass foobared/requirepass katerina/g" /etc/redis/redis.conf

# Перезапуск сервиса
sudo systemctl restart redis-server
sudo systemctl status redis-server
