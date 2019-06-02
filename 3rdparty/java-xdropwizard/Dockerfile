FROM ubuntu:14.04

RUN apt-get update && \
		apt-get -y install software-properties-common && \
		add-apt-repository -y ppa:linuxuprising/java && \
		apt-get update && \
		echo oracle-java12-installer shared/accepted-oracle-license-v1-2 select true | sudo /usr/bin/debconf-set-selections && \
		apt-get -y install oracle-java12-installer && \
		mkdir -p /opt/my/service

COPY target/xdropwizard.jar /opt/my/service/xdropwizard.jar
COPY xdropwizard.yml /opt/my/service/xdropwizard.yml

WORKDIR /opt/my/service

EXPOSE 8080
ENTRYPOINT ["java","-jar","/opt/my/service/xdropwizard.jar","server","xdropwizard.yml"]


