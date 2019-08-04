FROM ubuntu:18.10
RUN apt-get update && apt-get install -y python-pip python-dev build-essential

COPY . /opt/app
WORKDIR /opt/app
RUN pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["server.py"]
