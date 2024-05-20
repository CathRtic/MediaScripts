# Directory containing the MKV files (where the script is located)
$directory = $PSScriptRoot

# Get all MKV files in the directory
$mkvFiles = Get-ChildItem -Path $directory -Filter *.mkv

# Loop through each MKV file and apply the mkvpropedit command
foreach ($file in $mkvFiles) {
    $filePath = $file.FullName
    & mkvpropedit $filePath --edit track:s1 --set language=eng
    Write-Output "Updated language for $filePath"
}

Write-Output "All files processed."
