FROM ubuntu:18.04

RUN apt-get update && \
		apt-get -y install software-properties-common python g++ make && \
		apt-get -y install python-dev && \
		apt-get -y install python-pip && \
		mkdir -p /opt/my/service

COPY service /opt/my/service

WORKDIR /opt/my/service

RUN pip install -r requirements.txt

RUN adduser --disabled-password --gecos '' appuser\  
  && chown -R appuser:appuser /opt/my/service

USER appuser
EXPOSE 9000
ENTRYPOINT ["python","/opt/my/service/server.py"]
