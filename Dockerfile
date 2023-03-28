FROM maven:3.8.1-openjdk-17-slim AS build
COPY . /app
WORKDIR /app
RUN mvn clean install -DskipTests


FROM openjdk:17-jdk-slim
COPY --from=build /app/target/SqlScriptRunnerApplication.jar /app.jar
ENV SPRING_PROFILES_ACTIVE=docker
CMD  ["java", "-jar", "/app.jar"]
