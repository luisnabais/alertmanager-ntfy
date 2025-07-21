FROM python:3.13.5-slim

WORKDIR /app

# Install curl (and remove cache from apt to keep the image size small)
RUN apt-get update \
 && apt-get install -y curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Use environment variables for ntfy topic and token
ENV NTFY_TOPIC=""
ENV NTFY_TOKEN=""

CMD ["waitress-serve", "--listen=0.0.0.0:5000", "app:app"]
