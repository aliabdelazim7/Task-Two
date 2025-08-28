Write-Host "Building Hoen Scanner Microservice..." -ForegroundColor Green
Write-Host ""

# Check if Maven is available
try {
    $mvnVersion = mvn -version 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Maven found. Building project..." -ForegroundColor Yellow
        mvn clean package
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "Build successful! Starting the application..." -ForegroundColor Green
            Write-Host "The service will be available at http://localhost:8080" -ForegroundColor Cyan
            Write-Host "Press Ctrl+C to stop the application" -ForegroundColor Yellow
            Write-Host ""
            java -jar target/hoen-scanner-1.0.0.jar server config.yml
        } else {
            Write-Host "Build failed. Please check the error messages above." -ForegroundColor Red
        }
    }
} catch {
    Write-Host "Maven not found in PATH. Please install Maven or use IntelliJ IDEA." -ForegroundColor Red
    Write-Host ""
    Write-Host "To install Maven:" -ForegroundColor Yellow
    Write-Host "1. Download from https://maven.apache.org/download.cgi" -ForegroundColor White
    Write-Host "2. Extract to a directory (e.g., C:\Program Files\Apache\maven)" -ForegroundColor White
    Write-Host "3. Add the bin directory to your PATH environment variable" -ForegroundColor White
    Write-Host ""
    Write-Host "Alternatively, open this project in IntelliJ IDEA and run from there." -ForegroundColor Cyan
    Read-Host "Press Enter to continue"
}
