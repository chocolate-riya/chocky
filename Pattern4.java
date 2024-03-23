import java.util.*;
class Pattern4
{
	public static void main(String args[])
	{
		Scanner scn = new Scanner(System.in);
		System.out.println("Enter n value");
		int n = scn.nextInt();
		int i,j;
		for(i=0;i<=n;i++)
		{
			for(j=0;j<=i;++j)
			{
				System.out.print("* ");
			}
			System.out.println(" ");
		}
		System.out.print("");
	}
}
********************************************
	# Define the URL of the folder you want to download
$url = "https://webpaypg.jfrog.io/artifactory/docker-docker/gamutkart/"

# Define the local directory where you want to save the downloaded folder
$destinationFolder = "C:\Users\windows\fr"

# Define your username and password
$username = "webpay"
$password = "Azuredemo@123"

# Convert the username and password to a credential object
$credentials = New-Object System.Management.Automation.PSCredential ($username, (ConvertTo-SecureString -String $password -AsPlainText -Force))

# Make a request to the URL with authentication
$response = Invoke-WebRequest -Uri $url -Credential $credentials -Method Get

# Check if the request was successful
if ($response.StatusCode -eq 200) {
    # Create the destination directory if it does not exist
    if (-not (Test-Path -Path $destinationFolder)) {
        New-Item -Path $destinationFolder -ItemType Directory -Force
    }
    
    # Save the response content to a file
    $response.Content | Out-File -FilePath "$destinationFolder\folder.zip" -Force

    Write-Host "Folder downloaded successfully."
} else {
    Write-Host "Failed to download folder. Status code: $($response.StatusCode)"
}

