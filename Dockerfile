FROM python:3.11.3-slim-buster

# TODO: let the server download language data on demand
RUN apt-get update \
    && apt install tesseract-ocr* ghostscript pngquant -y \
    && apt-get clean

run mkdir /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

COPY server.py /app/server.py

ENTRYPOINT ["streamlit", "run", "server.py"]
