# Step 1: Use a lightweight Java 17 image
FROM openjdk:17-jdk-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy the correct JAR file
COPY target/EMP-backend.jar app.jar

# Step 4: Expose the application port
EXPOSE 8080

# Step 5: Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
