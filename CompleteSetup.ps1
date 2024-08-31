# Define the path to your Terraform configuration
$terraformPath = "C:\Workshop\AzSQLBang\08AzureBastionVM-AzureSQLDB-Final"

# Change to the Terraform directory
Set-Location $terraformPath

# Initialize Terraform
$initDuration = Measure-Command {
    terraform init
}

# Apply Terraform configuration
$applyDuration = Measure-Command {
    terraform apply -auto-approve
}

# Capture the total duration for the entire script
$totalDuration = $initDuration + $applyDuration

# Output the duration of each step
Write-Output "Terraform init duration: $($initDuration.TotalSeconds) seconds"
Write-Output "Terraform apply duration: $($applyDuration.TotalSeconds) seconds"

# Output the total duration
Write-Output "Total script execution duration: $($totalDuration.TotalSeconds) seconds"
