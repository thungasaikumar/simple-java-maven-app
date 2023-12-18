FROM maven:latest as builder
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:8-jre
WORKDIR /app
COPY --from=builder /app/target/my-app-1.0-SNAPSHOT.jar .
EXPOSE 6060
CMD ["java","-jar","my-app-1.0-SNAPSHOT.jar"]