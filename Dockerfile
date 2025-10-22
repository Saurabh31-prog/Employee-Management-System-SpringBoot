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

# 3. Build the project (skip tests to save time)
RUN mvn clean package -DskipTests

# ----------------------------
# Stage 2: Create lightweight runtime image
# ----------------------------
FROM openjdk:17-jdk-slim
WORKDIR /app

# 4. Copy the Spring Boot executable JAR
# Use wildcard to match any repackaged JAR (handles SNAPSHOT or versioned JARs)
COPY --from=build /app/target/*SNAPSHOT.jar app.jar

# 5. Verify the JAR (optional, helps debug in future)
RUN echo "JAR contents:" && jar tf app.jar | head -n 20

# 6. Expose the application port
EXPOSE 8080

# 7. Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
