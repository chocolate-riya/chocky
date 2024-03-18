# Define credentials
$Username = "webpay"
$Password = "Azuredemo@123"
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)

# Array of URLs of the files you want to download
$fileUrls = @(
    "https://webpaypg.jfrog.io/artifactory/docker-docker/gamutkart/11/manifest.json",
    "https://webpaypg.jfrog.io/artifactory/docker-docker/gamutkart/12/manifest.json"
)

# Destination folder where you want to save the files
$destinationFolder = "C:\Users\windows\Downloads"

# Create destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder -PathType Container)) {
    New-Item -Path $destinationFolder -ItemType Directory | Out-Null
}

# Loop through each URL and download the files
foreach ($url in $fileUrls) {
    $fileName = [System.IO.Path]::GetFileName($url)
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $destinationPath -Credential $Credential
}
