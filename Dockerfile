FROM gradle:4.7.0-jdk8-alpine AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon


# Use a base image do OpenJDK
FROM openjdk:11-jre-slim

EXPOSE 8080

# Define o diretório de trabalho dentro do contêiner
RUN mkdir /app

# Copia o arquivo JAR do aplicativo para o diretório de trabalho no contêiner
COPY --from=build /home/gradle/src/build/libs/*.jar /app/app.jar

# Define o comando a ser executado quando o contêiner for iniciado
CMD ["java", "-jar", "/app/app.jar"]
ENTRYPOINT ["java", "-jar", "/app/app.jar"]