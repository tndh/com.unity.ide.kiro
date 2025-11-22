# Script to test Kiro detection on Windows
# This helps debug why Kiro might not be detected by Unity

Write-Host "=== Kiro Detection Test ===" -ForegroundColor Magenta
Write-Host ""

$found = $false
$paths = @()

# Check LocalAppData
$localAppPath = [System.IO.Path]::Combine($env:LOCALAPPDATA, "Programs", "Kiro", "Kiro.exe")
$paths += $localAppPath
if (Test-Path $localAppPath) {
    Write-Host "[FOUND] $localAppPath" -ForegroundColor Green
    $found = $true
} else {
    Write-Host "[NOT FOUND] $localAppPath" -ForegroundColor Yellow
}

# Check Program Files
$programFiles = [System.IO.Path]::Combine($env:ProgramFiles, "Kiro", "Kiro.exe")
$paths += $programFiles
if (Test-Path $programFiles) {
    Write-Host "[FOUND] $programFiles" -ForegroundColor Green
    $found = $true
} else {
    Write-Host "[NOT FOUND] $programFiles" -ForegroundColor Yellow
}

# Check Program Files (x86)
if ($env:ProgramFiles86) {
    $programFilesX86 = [System.IO.Path]::Combine($env:ProgramFiles86, "Kiro", "Kiro.exe")
    $paths += $programFilesX86
    if (Test-Path $programFilesX86) {
        Write-Host "[FOUND] $programFilesX86" -ForegroundColor Green
        $found = $true
    } else {
        Write-Host "[NOT FOUND] $programFilesX86" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Scanning all fixed drives..." -ForegroundColor Cyan

# Check all drives
$drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -match '^[A-Z]:\\$' }
foreach ($drive in $drives) {
    $drivePath1 = [System.IO.Path]::Combine($drive.Root, "Program Files", "Kiro", "Kiro.exe")
    $drivePath2 = [System.IO.Path]::Combine($drive.Root, "Program Files (x86)", "Kiro", "Kiro.exe")
    
    if (Test-Path $drivePath1) {
        Write-Host "[FOUND] $drivePath1" -ForegroundColor Green
        $found = $true
        $paths += $drivePath1
    }
    
    if (Test-Path $drivePath2) {
        Write-Host "[FOUND] $drivePath2" -ForegroundColor Green
        $found = $true
        $paths += $drivePath2
    }
}

Write-Host ""
Write-Host "=== Summary ===" -ForegroundColor Magenta

if ($found) {
    Write-Host "✓ Kiro installation(s) found!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Unity should automatically detect Kiro at these locations." -ForegroundColor White
    Write-Host "If not, you can manually select it in Unity:" -ForegroundColor White
    Write-Host "  Edit > Preferences > External Tools > Browse..." -ForegroundColor Cyan
} else {
    Write-Host "✗ No Kiro installation found" -ForegroundColor Red
    Write-Host ""
    Write-Host "Searched locations:" -ForegroundColor Yellow
    foreach ($path in $paths) {
        Write-Host "  - $path" -ForegroundColor Gray
    }
    Write-Host ""
    Write-Host "Please install Kiro or specify the installation path manually." -ForegroundColor White
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
