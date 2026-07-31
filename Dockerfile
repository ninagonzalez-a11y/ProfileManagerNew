# Step 1: Build using Maven Wrapper
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Copy wrapper and configuration files first (for caching)
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw

# Copy source code and build
COPY src ./src
RUN ./mvnw clean package -DskipTests -Dcheckstyle.skip=true

# Step 2: Run the Application
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]