# webpsh
## Image to WebP Converter

A bash script that converts image files (PNG, JPG, JPEG) to WebP format.

## Prerequisites

- `cwebp` command-line tool

## Configuration

The script uses the following variables which you can customize:

```bash
SOURCE_DIR="/your/dir/path" # Directory containing source images
DEST_DIR="/your/dir/path"   # Directory for output WebP files
QUALITY=80                  # WebP conversion quality (0-100, default: 80)
```

## Features

- Converts PNG, JPG, and JPEG images to WebP format
- Skips already converted files
- Creates destination directory if it doesn't exist

## Usage

1. Set the source and destination directories in the script
2. Make the `webp.sh` executable:
   ```
   chmod +x webp.sh
   ```
3. Run the script:
   ```
   ./webp.sh
   ```

## Output

- Converted WebP files will be saved in the destination directory
- The script provides feedback for:
  - Skipped files (already converted)
  - Successful conversions
  - Failed conversions
