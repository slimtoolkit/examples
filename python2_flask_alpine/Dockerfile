FROM python:2.7-alpine

RUN mkdir -p /opt/my/service

COPY service /opt/my/service

WORKDIR /opt/my/service

RUN pip install -r requirements.txt

EXPOSE 1300
ENTRYPOINT ["python","/opt/my/service/server.py"]


