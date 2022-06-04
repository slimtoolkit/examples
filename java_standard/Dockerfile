FROM maven:3.3-jdk-8 as builder

WORKDIR /app

COPY . .

RUN mvn -Dmaven.test.skip=true package


FROM openjdk:8

WORKDIR /opt/my/service

COPY --from=builder /app/target/java-service-0.0.1.jar /opt/my/service/java-service.jar
COPY --from=builder /app/service.yml /opt/my/service/service.yml
COPY --from=builder /app/service.keystore /opt/my/service/service.keystore

EXPOSE 1300
ENTRYPOINT ["java","-jar","/opt/my/service/java-service.jar","server","service.yml"]
