# Directory containing the MKV files (where the script is located)
$directory = $PSScriptRoot

# Get all .srt files in the directory and its subdirectories
$srtFiles = Get-ChildItem -Path $directory -Filter *.srt -Recurse

# Loop through each .srt file and delete it
foreach ($file in $srtFiles) {
    Remove-Item -Path $file.FullName -Force
    Write-Output "Deleted $file.FullName"
}

Write-Output "All .srt files deleted."
