FROM node:18-bullseye

# Установка ffmpeg и зависимостей
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential curl gnupg

# Установка n8n
RUN npm install -g n8n

# Установка переменных окружения
ENV GENERIC_TIMEZONE=Asia/Almaty
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV WEBHOOK_URL=https://your-temporary-url.onrender.com

# Копирование данных
COPY n8n_data.tar.gz /data/
RUN mkdir -p /home/node/.n8n && tar -xzf /data/n8n_data.tar.gz -C /home/node/.n8n

# Переход в рабочую директорию
WORKDIR /home/node

# Использовать порт по умолчанию
EXPOSE 5678

# Запуск n8n
CMD ["n8n"]
