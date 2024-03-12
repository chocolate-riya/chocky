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