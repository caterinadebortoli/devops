# Connect to Azure account
az login 
$subscription_id = "<YourSubscriptionId>" 
az account set --subscription $subscription_id 

# Set variables for IoT Hub and device
$resourceGroupName = "<YourResourceGroupName>"
$iothubName = "<YourIoTHubName>"
$deviceId = "<YourDeviceId>"

# Get the IoT Hub connection string
$iotHub = Get-AzIotHub -ResourceGroupName $resourceGroupName -Name $iothubName

# Check if IoT Hub is retrieved successfully
if ($iotHub -eq $null) {
    Write-Error "Unable to retrieve IoT Hub. Please check if the IoT Hub exists and the provided information is correct."
    exit
}
# Create a new message
$message = @{
    deviceId = $deviceId
    messageId = [Guid]::NewGuid()
    messageBody = "This is a test message from PowerShell"
} | ConvertTo-Json

Write-Host $message
# Send the message to IoT Hub

az iot device send-d2c-message --hub-name $iothubName --device-id $deviceId --props '$.ct=application/json;$.ce=utf-8' --data "$message"

Write-Host "Message sent successfully."



