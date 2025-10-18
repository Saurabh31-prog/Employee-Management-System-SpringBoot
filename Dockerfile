# Use OpenJDK 21 as base image
FROM openjdk:21-jdk-slim

# Copy jar built by Maven
COPY target/Employe_Management-0.0.1-SNAPSHOT.jar app.jar
# Expose port 10000
EXPOSE 10000

# Start the application
ENTRYPOINT ["java","-jar","/app.jar"]
