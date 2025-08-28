Write-Host "Testing Hoen Scanner Data Files" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""

# Test rental cars data
Write-Host "Rental Cars Data:" -ForegroundColor Yellow
try {
    $rentalCars = Get-Content "src\main\resources\rental_cars.json" | ConvertFrom-Json
    $rentalCars | ForEach-Object {
        Write-Host "  City: $($_.city), Type: $($_.kind), Title: $($_.title)" -ForegroundColor White
    }
    Write-Host "  Total rental cars: $($rentalCars.Count)" -ForegroundColor Cyan
} catch {
    Write-Host "Error reading rental_cars.json: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# Test hotels data
Write-Host "Hotels Data:" -ForegroundColor Yellow
try {
    $hotels = Get-Content "src\main\resources\hotels.json" | ConvertFrom-Json
    $hotels | ForEach-Object {
        Write-Host "  City: $($_.city), Type: $($_.kind), Title: $($_.title)" -ForegroundColor White
    }
    Write-Host "  Total hotels: $($hotels.Count)" -ForegroundColor Cyan
} catch {
    Write-Host "Error reading hotels.json: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# Group by city
Write-Host "Data by City:" -ForegroundColor Yellow
$allData = @()
try {
    $rentalCars = Get-Content "src\main\resources\rental_cars.json" | ConvertFrom-Json
    $hotels = Get-Content "src\main\resources\hotels.json" | ConvertFrom-Json
    $allData = $rentalCars + $hotels
    
    $groupedData = $allData | Group-Object city
    $groupedData | ForEach-Object {
        Write-Host "  $($_.Name): $($_.Count) items" -ForegroundColor Cyan
        $_.Group | ForEach-Object {
            Write-Host "    - $($_.kind): $($_.title)" -ForegroundColor White
        }
        Write-Host ""
    }
} catch {
    Write-Host "Error processing data: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "Total items: $($allData.Count)" -ForegroundColor Green
