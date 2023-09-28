# Use a base image do OpenJDK
FROM openjdk:11-jre-slim
EXPOSE 8080
ADD build/libs/demo-0.0.1-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]