FROM python:3.9-slim-bullseye

# Установка Java и Allure
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jre wget unzip ca-certificates && \
    wget -q https://github.com/allure-framework/allure2/releases/download/2.27.0/allure-2.27.0.zip && \
    unzip -q allure-2.27.0.zip -d /opt && \
    ln -s /opt/allure-2.27.0/bin/allure /usr/bin/allure && \
    rm -rf /var/lib/apt/lists/* allure-2.27.0.zip

WORKDIR /app

# Кеширование зависимостей
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --prefer-binary --no-cache-dir -r requirements.txt

# Копируем только нужное
COPY . .

CMD ["sh", "-c", "PYTHONPATH=/app pytest --alluredir=allure-results && allure generate allure-results -o allure-report --clean"]
