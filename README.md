# MediaScripts

## Overview

MediaScripts is a collection of scripts designed to batch manipulate media files efficiently. These scripts can automate various tasks related to media file management, helping users streamline their workflow.

## Features

- **Batch Deletion**: Remove specific types of media files in bulk.
- **Language Update**: Update the language metadata of media files.
- **Selective Removal**: Delete non-English/Japanese media files.
- **Subtitle Management**: Remove specific subtitle formats from media files.

## Scripts

1. **deleteSRTFiles.ps1**: Batch delete SRT subtitle files.
2. **missing.py**: Identify and list missing media files.
3. **removeNonEngJap.ps1**: Remove media files that are not in English or Japanese.
4. **remove_vobsub.ps1**: Delete VOBSUB subtitle files.
5. **updateLanguage.ps1**: Update the language information of media files.

## Getting Started

### Prerequisites

- PowerShell (for .ps1 scripts)
- Python 3.x (for .py scripts)
- [MKVToolNix](https://mkvtoolnix.download/downloads.html) (for `mkvmerge` and `mkvpropedit`)

### Installation

Clone the repository to your local machine:

```sh
git clone https://github.com/CathRtic/MediaScripts.git
```
### Usage

Navigate to the directory and execute the desired script:
```sh
# For PowerShell scripts
./script_name.ps1

# For Python scripts
python script_name.py

```