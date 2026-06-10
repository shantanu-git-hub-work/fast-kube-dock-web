FROM python:3.14-slim

RUN pip install --upgrade pip

WORKDIR /web

COPY ./requirements.txt  /web/requirements.txt
COPY ./main.py  /web/main.py

RUN pip install --no-cache-dir --upgrade -r /web/requirements.txt

COPY ./app  /web/app

CMD ["fastapi","run","main.py"]


