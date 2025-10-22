# Stage 1: Build the app
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml to cache dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build Spring Boot app
RUN mvn clean package -DskipTests

# Stage 2: Lightweight runtime
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the actual JAR built in stage 1 (wildcard)
COPY --from=build /app/target/*.jar app.jar

# Expose port and run
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
