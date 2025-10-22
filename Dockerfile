# Step 1: Build stage - build the JAR
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml first to cache dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build the project
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: Run stage - lightweight JDK
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy JAR from the build stage
COPY --from=build /app/target/EMP-backend.jar app.jar

# Expose port and run
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
