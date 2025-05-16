FROM python:3.9-slim

# Установим Java и Allure CLI
RUN apt-get update && \
    apt-get install -y openjdk-17-jre wget unzip && \
    wget https://github.com/allure-framework/allure2/releases/download/2.27.0/allure-2.27.0.zip && \
    unzip allure-2.27.0.zip -d /opt && \
    ln -s /opt/allure-2.27.0/bin/allure /usr/bin/allure && \
    rm allure-2.27.0.zip

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["sh", "-c", "pytest && allure generate allure-results -o allure-report --clean"]
