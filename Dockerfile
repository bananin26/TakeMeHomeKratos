FROM maven:3.9.2-amazoncorretto-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/TakemeHome00Application.class app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","TakemeHome0_0.jar"]

