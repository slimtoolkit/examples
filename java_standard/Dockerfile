FROM openjdk:8

WORKDIR /opt/my/service

COPY target/java-service-0.0.1.jar /opt/my/service/java-service.jar
COPY service.yml /opt/my/service/service.yml
COPY service.keystore /opt/my/service/service.keystore

EXPOSE 8080
ENTRYPOINT ["java","-jar","/opt/my/service/java-service.jar","server","service.yml"]


