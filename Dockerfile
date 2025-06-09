FROM n8nio/n8n

# Устанавливаем ffmpeg
USER root
RUN apt-get update && apt-get install -y ffmpeg

# Устанавливаем переменные окружения
ENV GENERIC_TIMEZONE=Asia/Almaty
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV WEBHOOK_URL=https://your-temporary-url.onrender.com

# Копируем архив с данными
COPY n8n_data.tar.gz /data/
RUN tar -xzf /data/n8n_data.tar.gz -C /home/node/.n8n

USER node
