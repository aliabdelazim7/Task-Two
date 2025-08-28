# Hoen Scanner Microservice

A Java Dropwizard microservice for searching rental cars and hotels by city.

## Prerequisites

- Java 21 (OpenJDK 21) - **Updated to match your system**
- Maven 3.6+
- IntelliJ IDEA (recommended)

## Setup Instructions

1. **Install IntelliJ IDEA** if you haven't already
2. **Open the project** in IntelliJ IDEA
3. **Load Maven Project** when prompted
4. **Install Java 19** if you receive JDK-related errors
5. **Run the application** by clicking the green arrow in the upper right corner

## Running the Application

1. **Build the project**: `mvn clean package`
2. **Run the application**: `java -jar target/hoen-scanner-1.0.0.jar server config.yml`
3. **Access the service**: The microservice will be available at `http://localhost:8080`

## API Usage

### Search Endpoint

- **URL**: `POST /search`
- **Content-Type**: `application/json`
- **Request Body**: `{"city": "petalborough"}`
- **Response**: JSON array of search results matching the city

### Example Request

```bash
curl -X POST http://localhost:8080/search \
  -H "Content-Type: application/json" \
  -d '{"city": "petalborough"}'
```

### Test Cities

- `petalborough` - 3 rental cars, 3 hotels
- `rustburg` - 2 rental cars, 2 hotels
- `shaleport` - 2 rental cars, 2 hotels

## Project Structure

```
src/
├── main/
│   ├── java/com/example/
│   │   ├── HoenScannerApplication.java    # Main application class
│   │   ├── HoenScannerConfiguration.java  # Configuration class
│   │   ├── models/
│   │   │   ├── Search.java               # Search request model
│   │   │   └── SearchResult.java         # Search result model
│   │   └── resources/
│   │       └── SearchResource.java       # REST endpoint handler
│   └── resources/
│       ├── rental_cars.json              # Car rental data
│       └── hotels.json                   # Hotel data
├── pom.xml                               # Maven configuration
├── config.yml                            # Dropwizard configuration
└── README.md                             # This file
```

## Testing with Postman

1. Download and install Postman
2. Create a new POST request to `http://localhost:8080/search`
3. Set Content-Type header to `application/json`
4. Add request body: `{"city": "petalborough"}`
5. Send the request to test the API

## Building and Running

```bash
# Build the project
mvn clean package

# Run the application
java -jar target/hoen-scanner-1.0.0.jar server config.yml
```

The application will start and display "Welcome to Hoen Scanner!" in the logs.

