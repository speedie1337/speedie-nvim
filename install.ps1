Write-Output 3
Start-Sleep -Seconds 1
Write-Output 2
Start-Sleep -Seconds 1
Write-Output 1
Start-Sleep -Seconds 1

if (Test-Path "$env:USERPROFILE\AppData\Local\nvim") {
    Copy-Item -Path "$env:USERPROFILE\AppData\Local\nvim" -Destination "$env:TEMP\nvim-backup" -Recurse -Force
    Remove-Item -Path "$env:USERPROFILE\AppData\Local\nvim" -Recurse -Force
}

Copy-Item -Path ".config\nvim" -Destination "$env:USERPROFILE\AppData\Local\" -Recurse -Force
New-Item -Path "$env:USERPROFILE\AppData\Local\nvim\spell" -ItemType Directory -Force

Write-Output "installed."
