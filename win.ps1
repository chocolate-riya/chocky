$sourceServer = "98.71.26.159"
$sourceUsername = "windows"
$sourcePassword = "Azuredemo@123" | ConvertTo-SecureString -AsPlainText -Force
$sourceCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $sourceUsername, $sourcePassword
$sourceDirectory = "C:\Users\windows\Downloads\sam"
 
# Destination server details
$destinationServer = "20.220.29.48"
$destinationUsername = "windove"
$destinationPassword = "Azuredemo@123" | ConvertTo-SecureString -AsPlainText -Force
$destinationCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $destinationUsername, $destinationPassword
$destinationDirectory = "C:\Users\windove\Downloads"
 
# Copy files from source to destination using PowerShell remoting
Invoke-Command -ComputerName $sourceServer -Credential $sourceCredential -ScriptBlock {
    param($sourceDirectory, $destinationServer, $destinationCredential, $destinationDirectory)
	Copy-Item -Path $sourceDirectory -Destination $destinationDirectory -Recurse -Force
 
} -ArgumentList $sourceDirectory, $destinationServer, $destinationCredential, $destinationDirectory

*************************************************************************************************************************
$fileUrls = @(
    "https://example.com/file1.txt",
    "https://example.com/file2.txt",
    "https://example.com/file3.txt"
)

 

# Destination folder where you want to save the files
$destinationFolder = "C:\Downloads"

 

# Loop through each URL and download the files
foreach ($url in $fileUrls) {
    $fileName = [System.IO.Path]::GetFileName($url)
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $destinationPath
}
***********************************************************************************************************
#!/bin/bash

# Define credentials
username="your_username"
password="your_password"

# Array of URLs of the files you want to download
fileUrls=(
    "https://webpaypg.jfrog.io/artifactory/docker-docker/gamutkart/11/file1.txt"
    "https://webpaypg.jfrog.io/artifactory/docker-docker/gamutkart/11/file2.txt"
    "https://webpaypg.jfrog.io/artifactory/docker-docker/gamutkart/12/file3.txt"
)

# Destination folder where you want to save the files
destinationFolder="/path/to/destination/folder"

# Loop through each URL and download the files
for url in "${fileUrls[@]}"; do
    filename=$(basename "$url")
    curl -u "$username:$password" -o "$destinationFolder/$filename" "$url"
done
***************************************************************************************************************
#!/bin/bash

# Directory containing downloaded files
downloadDirectory="/path/to/downloaded/files"

# Check if the directory exists
if [ -d "$downloadDirectory" ]; then
    # List files in the directory
    echo "Downloaded files:"
    ls "$downloadDirectory"
else
    echo "Download directory '$downloadDirectory' not found."
fi
***************************************************************************************************************************
#!/bin/bash

# Array of files to delete
files=(
    "/path/to/file1.txt"
    "/path/to/file2.txt"
    "/path/to/file3.txt"
)

# Loop through each file and delete it
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "Deleted: $file"
    else
        echo "File not found: $file"
    fi
done
******************************************************************************************
$url = "https://webpaypg.jfrog.io/artifactory/docker-docker/gamutkart/"  # Replace with the URL of the folder you want to download
$destinationFolder = "C:\Users\windows\Downloads\frog"  # Replace with the destination folder where you want to save the downloaded files

# Create destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder -PathType Container)) {
    New-Item -Path $destinationFolder -ItemType Directory | Out-Null
}

# Download folder contents
$response = Invoke-WebRequest -Uri $url -OutFile "$destinationFolder\folder.zip"

# Unzip the downloaded folder
Expand-Archive -Path "$destinationFolder\folder.zip" -DestinationPath $destinationFolder -Force

# Remove the downloaded zip file
Remove-Item -Path "$destinationFolder\folder.zip"

