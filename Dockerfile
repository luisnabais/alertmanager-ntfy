FROM python:3.13.5-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Usa variáveis de ambiente para o tópico e token
ENV NTFY_TOPIC=""
ENV NTFY_TOKEN=""

CMD ["waitress-serve", "--listen=0.0.0.0:5000", "app:app"]
