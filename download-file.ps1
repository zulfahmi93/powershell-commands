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

$EnteredUrl = Read-Host -Prompt 'Source URL of file to download'
$EnteredPath = Read-Host -Prompt 'Destination'
$VerifiedPath = Verify-Destination $EnteredPath

# Using BITS (Windows only)
Start-BitsTransfer -Source $EnteredUrl -Destination $VerifiedPath
