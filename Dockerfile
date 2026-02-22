# Get the base image for building and running the application
FROM eclipse-temurin:21-jdk-jammy

# Set the working directory inside the container
WORKDIR /app

# Copy all project files from the host to the container
COPY . .

# Build the Maven project: clean the target directory, run tests and package using Maven wrapper
# -DskipTests skips running unit tests during build
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Expose port 8080 for the Spring Boot application
EXPOSE 8080

# Define the entry point to run the packaged JAR file when the container starts
ENTRYPOINT ["sh", "-c", "java -jar target/*.jar"]