#!/bin/bash

#bucket="rh-terraform-state-dev";
read -p "Please enter a bucket name to store statefile: " bucket
result=$(aws s3api list-buckets --query "Buckets[?Name=='$bucket'].Name" --output text)

if [ "$bucket" == "$result" ]; 
then
    echo "The specified bucket $bucket already exists keep going .";
else
    aws s3 mb s3://$bucket
    echo "The specified bucket $bucket was created" 
fi


# terraform init -backend=true -upgrade=true -get=true -backend-config="bucket=$bucket" -backend-config="region=us-east-1" -backend-config="key=state/terraform.tfstate"     