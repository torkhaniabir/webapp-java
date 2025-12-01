FROM eclipse-temurin:17-jdk-jammy
VOLUME /tmp
ARG JAR_FILE=target/demo-1.0.0.jar
COPY ${JAR_FILE} app.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","/app.jar"]

