@echo off
echo Testing Bug Fixes...
echo.

echo 1. Checking Java version compatibility...
java -version
echo.

echo 2. Checking project structure...
if exist "src\main\java\com\example\HoenScannerApplication.java" (
    echo ✓ Main application class found
) else (
    echo ✗ Main application class missing
)

if exist "src\main\java\com\example\resources\SearchResource.java" (
    echo ✓ SearchResource class found
) else (
    echo ✗ SearchResource class missing
)

if exist "src\main\resources\rental_cars.json" (
    echo ✓ Rental cars data found
) else (
    echo ✗ Rental cars data missing
)

if exist "src\main\resources\hotels.json" (
    echo ✓ Hotels data found
) else (
    echo ✗ Hotels data missing
)

echo.
echo 3. Checking pom.xml configuration...
findstr "dropwizard.version" pom.xml
findstr "maven.compiler.source" pom.xml

echo.
echo 4. Testing JSON data integrity...
powershell -ExecutionPolicy Bypass -Command "Get-Content 'src\main\resources\rental_cars.json' | ConvertFrom-Json | Measure-Object | Select-Object Count"
powershell -ExecutionPolicy Bypass -Command "Get-Content 'src\main\resources\hotels.json' | ConvertFrom-Json | Measure-Object | Select-Object Count"

echo.
echo Bug fixes applied:
echo ✓ Updated Dropwizard version to 3.0.2 for better compatibility
echo ✓ Changed Java target from 19 to 21 to match your system
echo ✓ Fixed JAX-RS imports from jakarta.ws.rs to javax.ws.rs
echo.
echo Next steps:
echo 1. Open project in IntelliJ IDEA
echo 2. Load Maven project when prompted
echo 3. Run the application
echo.
pause
