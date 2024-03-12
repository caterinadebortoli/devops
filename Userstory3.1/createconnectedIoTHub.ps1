# Connect to Azure account
Connect-AzAccount

# Set variables for IoT Hub and device
$resourceGroupName = "<YourResourceGroupName>"
$iothubName = "<YourIoTHubName>"
$deviceId = "<YourDeviceId>"

# Get the IoT Hub connection string
$iotHub = Get-AzIotHub -ResourceGroupName $resourceGroupName -Name $iothubName
$connectionString = $iotHub.Properties.HostName

# Create a new message
$message = @{
    deviceId = $deviceId
    messageId = [Guid]::NewGuid()
    messageBody = "This is a test message from PowerShell"
} | ConvertTo-Json

# Send the message to IoT Hub
$endpoint = "devices/{0}/messages/events?api-version=2020-03-13" -f $deviceId
$uri = "https://$connectionString/$endpoint"

Invoke-RestMethod -Uri $uri -Headers @{"Authorization"="SharedAccessSignature $($iotHub.Properties.AuthorizationPolicies[0].PrimaryKey)"} -Method POST -Body $message -ContentType "application/json"

Write-Host "Message sent successfully."



