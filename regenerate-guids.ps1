# Script to regenerate all Unity meta file GUIDs
# This allows the Kiro package to coexist with Windsurf package

function New-UnityGuid {
    return [guid]::NewGuid().ToString("N")
}

function Update-MetaFileGuid {
    param (
        [string]$FilePath
    )
    
    if (Test-Path $FilePath) {
        $content = Get-Content $FilePath -Raw
        
        # Match Unity GUID format
        if ($content -match 'guid:\s*([a-f0-9]{32})') {
            $oldGuid = $matches[1]
            $newGuid = New-UnityGuid
            
            $newContent = $content -replace "guid:\s*$oldGuid", "guid: $newGuid"
            Set-Content -Path $FilePath -Value $newContent -NoNewline
            
            Write-Host "Updated: $FilePath" -ForegroundColor Green
            Write-Host "  Old GUID: $oldGuid" -ForegroundColor Yellow
            Write-Host "  New GUID: $newGuid" -ForegroundColor Cyan
        }
    }
}

Write-Host "=== Regenerating Unity Meta File GUIDs ===" -ForegroundColor Magenta
Write-Host "This will allow Kiro package to coexist with Windsurf package" -ForegroundColor Magenta
Write-Host ""

# Get all .meta files
$metaFiles = Get-ChildItem -Path "." -Filter "*.meta" -Recurse

Write-Host "Found $($metaFiles.Count) meta files" -ForegroundColor White
Write-Host ""

$count = 0
foreach ($file in $metaFiles) {
    Update-MetaFileGuid -FilePath $file.FullName
    $count++
}

Write-Host ""
Write-Host "=== Completed ===" -ForegroundColor Magenta
Write-Host "Updated $count meta files with new GUIDs" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Commit these changes to your repository" -ForegroundColor White
Write-Host "2. The Kiro package can now coexist with Windsurf package" -ForegroundColor White
