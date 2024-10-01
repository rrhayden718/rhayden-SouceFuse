Templates for ECS(fargate) and ALB pattern

TerraForm

To use this project, Ensure you have the following:
  1. Your own AWS account, with access keys for a deployment role.
  2. Terraform installed on your machine
  3. AWS CLI Installed
  4. (Optional) AWS Powershell modules 

Steps to use:
  1. Clone the repo to your desired location
  2. Edit the terraform.tfvars file with your desired values
  3. Run init script (init.sh or init.ps1)  
  4. Run "terraform plan" and "terraform apply"
  4. To access the application, navigate to the Load Balancer in the
     AWS console and paste the dns name of the Load Balancer in a new tab. 




Python

Steps to use:
1. run pip3 install -r requirement.txt 
2. python3 cli.py --bucket_name rh-ecs-test-bucket --family nginx-td
