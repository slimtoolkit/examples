FROM centos:7

RUN yum -y update && \
	yum -y install epel-release && \
	yum -y install python-pip && \
	yum -y install python-devel && \
	yum -y groupinstall 'development tools' && \
	yum clean all && \
	mkdir -p /opt/my/service

COPY service /opt/my/service

WORKDIR /opt/my/service

RUN pip install -r requirements.txt

EXPOSE 9000
ENTRYPOINT ["python","/opt/my/service/server.py"]


