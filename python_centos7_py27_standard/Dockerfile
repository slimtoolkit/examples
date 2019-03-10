FROM centos/python-27-centos7

RUN mkdir -p /opt/app-root/my/service

COPY service /opt/app-root/my/service

WORKDIR /opt/app-root/my/service

RUN . /opt/app-root/etc/scl_enable && pip install -r requirements.txt

EXPOSE 9000
ENTRYPOINT . /opt/app-root/etc/scl_enable && python /opt/app-root/my/service/server.py


