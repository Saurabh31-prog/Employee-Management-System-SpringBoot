# ----------------------------
# Stage 1: Build the Spring Boot app
# ----------------------------
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# 1. Copy pom.xml first to cache dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# 2. Copy the source code
COPY src ./src

# 3. Build the project (skip tests)
RUN mvn clean package -DskipTests

# ----------------------------
# Stage 2: Lightweight runtime image
# ----------------------------
FROM openjdk:17-jdk-slim
WORKDIR /app

# 4. Copy the correct Spring Boot executable JAR
COPY --from=build /app/target/EMP-backend.jar app.jar

# 5. Expose port
EXPOSE 8080

# 6. Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
