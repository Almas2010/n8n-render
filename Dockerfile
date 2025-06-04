FROM n8nio/n8n

ENV GENERIC_TIMEZONE=Asia/Almaty
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV WEBHOOK_URL=https://your-temporary-url.onrender.com

FROM n8nio/n8n

# Копируем архив и распаковываем данные в нужную директорию
COPY n8n_data.tar.gz /data/
RUN tar -xzf /data/n8n_data.tar.gz -C /home/node/.n8n
