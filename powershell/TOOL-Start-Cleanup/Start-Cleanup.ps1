[CmdletBinding()]
param (
    $path
)

if ($path) {
    Set-Location $path
}

# Get files in folder
$files = Get-ChildItem -File | Select-Object Name

# Define folder names
$folders = "COMPRESSED FILES","EXECUTABLES","INSTALLERS","DOCUMENTS","IMAGES","OTHER"

# Create folders if not exist
$folders | ForEach-Object {
    if (-not (Test-Path -LiteralPath $_)) {
        New-Item -ItemType Directory $_
    }
}

# Move files to folders (keep existing folders for now)
$files | ForEach-Object {
    switch -Regex ($_.Name) {
        '\.7z|\.zip|\.rar+$' { Move-Item -Path $_ -Destination '.\COMPRESSED FILES' }
        '\.exe|\.com+$' { Move-Item -Path $_ -Destination '.\EXECUTABLES' }
        '\.msi+$' { Move-Item -Path $_ -Destination '.\INSTALLERS' }
        '\.jpg|\.tiff|\.png|\.gif+$' { Move-Item -Path $_ -Destination '.\IMAGES' }
        '\.pdf|\.txt|\.doc|\.xls|\.ppt|\.pps+$' { Move-Item -Path $_ -Destination '.\DOCUMENTS' }
        Default { Move-Item -Path $_ -Destination '.\OTHER' }
    }
}