FROM ubuntu:18.04
RUN apt-get update && apt-get install -y python-pip python-dev build-essential

COPY service /opt/app
WORKDIR /opt/app
RUN pip install -r requirements.txt

EXPOSE 1300
ENTRYPOINT ["python"]
CMD ["server.py"]
