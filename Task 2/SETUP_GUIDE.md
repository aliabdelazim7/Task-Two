# Hoen Scanner Microservice - Setup Guide

## 🚀 Quick Start

This guide will walk you through setting up and running the Hoen Scanner microservice step by step.

## 📋 Prerequisites

- **Java 21+** (OpenJDK 21 or higher) ✅ **Already installed on your system**
- **IntelliJ IDEA** (recommended IDE)
- **Maven** (for building the project)

## 🛠️ Setup Steps

### Step 1: Install IntelliJ IDEA

1. Download IntelliJ IDEA from [https://www.jetbrains.com/idea/](https://www.jetbrains.com/idea/)
2. Install and launch IntelliJ IDEA
3. Choose the Community Edition (free) or Ultimate Edition

### Step 2: Open the Project in IntelliJ

1. In IntelliJ, click "Open" or "Open Project"
2. Navigate to your project folder: `C:\Users\Administrator\Desktop\Task 2`
3. Select the folder and click "OK"

### Step 3: Load Maven Project

1. IntelliJ will detect the Maven project automatically
2. Look for a pop-up in the bottom right corner: "Maven projects need to be imported"
3. Click "Load Maven Project" to import dependencies
4. Wait for the project to finish loading

### Step 4: Java Version (Already Configured)

- ✅ The project is now configured for Java 21, which matches your system
- No additional Java installation needed
- The project will compile and run with your current Java version

### Step 5: Run the Application

1. Look for the green arrow (▶️) in the upper right corner
2. Click it to run the project
3. You should see logs with "Welcome to Hoen Scanner!" message
4. The service will be available at `http://localhost:8080`

## 🧪 Testing the API

### Option 1: Using Postman (Recommended)

1. Download Postman from [https://www.postman.com/downloads/](https://www.postman.com/downloads/)
2. Install and open Postman
3. Create a new request:
   - **Method**: POST
   - **URL**: `http://localhost:8080/search`
   - **Headers**: `Content-Type: application/json`
   - **Body** (raw JSON): `{"city": "petalborough"}`
4. Click "Send" to test the API

### Option 2: Using PowerShell

```powershell
# Test the data files
.\test-data.ps1

# Run the application (if Maven is installed)
.\run.ps1
```

### Option 3: Using Command Line

```bash
# Build the project
mvn clean package

# Run the application
java -jar target/hoen-scanner-1.0.0.jar server config.yml
```

## 📊 Test Data

The application includes sample data for three cities:

- **petalborough**: 3 rental cars + 3 hotels = 6 items
- **rustburg**: 2 rental cars + 2 hotels = 4 items
- **shaleport**: 2 rental cars + 2 hotels = 4 items

**Total**: 14 searchable items

## 🔍 API Endpoints

- **POST** `/search` - Search for rental cars and hotels by city
- **Request**: `{"city": "petalborough"}`
- **Response**: JSON array of matching results

## 📁 Project Structure

```
Task 2/
├── src/main/java/com/example/
│   ├── HoenScannerApplication.java      # Main application
│   ├── HoenScannerConfiguration.java    # Configuration
│   ├── models/
│   │   ├── Search.java                  # Search request model
│   │   └── SearchResult.java            # Search result model
│   └── resources/
│       └── SearchResource.java          # REST endpoint
├── src/main/resources/
│   ├── rental_cars.json                 # Car rental data
│   └── hotels.json                      # Hotel data
├── pom.xml                              # Maven configuration
├── config.yml                           # Dropwizard config
├── README.md                            # Project documentation
├── SETUP_GUIDE.md                       # This guide
├── run.bat                              # Windows batch file
├── run.ps1                              # PowerShell script
└── test-data.ps1                        # Data testing script
```

## 🚨 Troubleshooting

### Common Issues:

1. **Maven not found**: Install Maven or use IntelliJ's built-in Maven
2. **Java version error**: Ensure Java 19+ is installed and configured
3. **Port 8080 in use**: Change the port in `config.yml` or stop other services
4. **Build failures**: Check that all dependencies are downloaded

### Getting Help:

- Check the IntelliJ Event Log for error details
- Verify Java and Maven versions
- Ensure all files are in the correct directory structure

## ✅ Success Criteria

Your application is working correctly when:

1. ✅ IntelliJ loads the project without errors
2. ✅ Maven dependencies are downloaded successfully
3. ✅ Application starts and shows "Welcome to Hoen Scanner!"
4. ✅ API responds to POST requests at `http://localhost:8080/search`
5. ✅ Search results are returned for valid cities
6. ✅ Empty results are returned for invalid cities

## 🎯 Next Steps

Once your application is running:

1. Test with different cities: `petalborough`, `rustburg`, `shaleport`
2. Try invalid cities to test error handling
3. Commit and push your changes to your Git repository
4. Share your repository URL for submission

---

**Happy coding! 🎉**
