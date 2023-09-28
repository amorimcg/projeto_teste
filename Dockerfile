# Use a base image do OpenJDK
FROM openjdk:11-jre-slim

EXPOSE 8080

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo JAR do aplicativo para o diretório de trabalho no contêiner
COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar /app/app.jar

# Define o comando a ser executado quando o contêiner for iniciado
CMD ["java", "-jar", "app.jar"]