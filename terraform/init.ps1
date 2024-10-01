Install-Module -Name AWSPowerShell -Force
Install-Module -Name AWS.Tools.Common -Force
Install-Module -Name AWS.Tools.Installer -Force
Install-AWSToolsModule AWS.Tools.EC2,AWS.Tools.S3 -Force
$bucketName = Read-Host "Please enter a bucket name to store statefile:"
$result = (aws s3 ls $bucketName)

if(Get-S3Bucket -BucketName $bucketName){
    Write-Host "The specified bucket $bucketName already exists keep going ."
    }
else{
        aws s3 mb s3://$bucketName 
        Write-Host "The specified bucket $bucketName was created" 
    }    


terraform init -backend=true -upgrade=true -get=true -backend-config="bucket=$bucketName" -backend-config="region=us-east-1" -backend-config="key=state/terraform.tfstate"     