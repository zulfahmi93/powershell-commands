function Verify-Destination {
    param([String]$Destination)

    if ([string]::IsNullOrWhiteSpace($Destination)) {
        return $PSScriptRoot;
    }

    if (([System.IO.Directory]::Exists($Destination)) -ne $True) {
        Write-Warning 'Destination path does not exist! The path will be created.'
        ([System.IO.Directory]::CreateDirectory($Destination)) | Out-Null
    }

    return $Destination
}

$ZipFile = Read-Host -Prompt 'File to be unzipped'
$EnteredPath = Read-Host -Prompt 'Destination'
$VerifiedPath = Verify-Destination $EnteredPath

Expand-Archive -Path $ZipFile -DestinationPath $VerifiedPath