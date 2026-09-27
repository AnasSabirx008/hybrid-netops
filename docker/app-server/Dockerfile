FROM python:3.12-alpine

RUN apk add --no-cache \
    iproute2 \
    iputils \
    curl

WORKDIR /app

RUN pip install --no-cache-dir flask

COPY app.py .
COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
