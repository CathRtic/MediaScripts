# Directory containing the MKV files (where the script is located)
$directory = $PSScriptRoot

# Subfolder to save the cleaned files
$cleanedDirectory = [System.IO.Path]::Combine($directory, "cleaned")

# Create the subfolder if it doesn't exist
if (-not (Test-Path -Path $cleanedDirectory)) {
    New-Item -ItemType Directory -Path $cleanedDirectory
}

# Get all MKV files in the directory
$mkvFiles = Get-ChildItem -Path $directory -Filter *.mkv

foreach ($file in $mkvFiles) {
    $filePath = $file.FullName

    # Get track information in JSON format
    $jsonOutput = & mkvmerge -J "$filePath"
    $json = $jsonOutput | ConvertFrom-Json

    $trackIDsToKeep = @()

    foreach ($track in $json.tracks) {
        if ($track.properties.language -eq "eng" -or $track.properties.language -eq "en-US" -or $track.properties.language -eq "jpn") {
            $trackIDsToKeep += $track.id
        }
    }

    $trackIDsToKeepString = $trackIDsToKeep -join ","

    if ($trackIDsToKeepString -ne "") {
        # Create a new file with only the desired tracks in the cleaned subfolder
        $newFilePath = [System.IO.Path]::Combine($cleanedDirectory, $file.Name)
        & mkvmerge -o "$newFilePath" --audio-tracks $trackIDsToKeepString --subtitle-tracks $trackIDsToKeepString "$filePath"
        Write-Output "Processed $filePath and saved as $newFilePath"
    } else {
        Write-Output "No English or Japanese tracks found in $filePath"
    }
}

Write-Output "All files processed."
