@echo off
echo Building Hoen Scanner Microservice...
echo.

REM Check if Maven is available
where mvn >nul 2>nul
if %errorlevel% neq 0 (
    echo Maven not found in PATH. Please install Maven or use IntelliJ IDEA.
    echo.
    echo To install Maven:
    echo 1. Download from https://maven.apache.org/download.cgi
    echo 2. Extract to a directory (e.g., C:\Program Files\Apache\maven)
    echo 3. Add the bin directory to your PATH environment variable
    echo.
    echo Alternatively, open this project in IntelliJ IDEA and run from there.
    pause
    exit /b 1
)

echo Building project...
mvn clean package
if %errorlevel% neq 0 (
    echo Build failed. Please check the error messages above.
    pause
    exit /b 1
)

echo.
echo Build successful! Starting the application...
echo The service will be available at http://localhost:8080
echo Press Ctrl+C to stop the application
echo.

java -jar target/hoen-scanner-1.0.0.jar server config.yml
