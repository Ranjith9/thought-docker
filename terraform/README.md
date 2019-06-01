This folder consists of terraform scripts which will automate the solution for the given problem.

# Pre-requisits

1) docker should be installed (any version of docker with API version less than 1.32).
2) terraform should be installed(v 0.11.8).

All the required resources to bring up docker service is written under docker_company_news.tf
To make the code more dynamic the the variables are declared under variables.tf and values for different environmets being fed by aapropriate .tfvars files(in this scenario "variables.tfvars").

To authenticate to docker registry and docker daemon the required codes are present under providers.tf  
All the values are provided in .tfvars except registry credentials. and the same are fed via environment variables and can be done by following commands

$ export TF_VAR_doc_registery_user="user"
$ export TF_VAR_doc_registery_password="password"

# To bring up the environments use the following commands in the terraform directory.

$ terraform init -input=false 
$ terraform plan -out=docker.tfplan -var-file=variables/variables.tfvars -input=false

The above command will generate a plan with the file .tfplan in the same directory for the below command to create resources.

$ terraform apply -input=false docker.tfplan

The below command will help to destroy the things terraform created as for the plan.
$ terraform destroy -var-file=variables/variables.tfvars

# Enhancements

The resource docker_service of terraform was used multiple times but can be optimised by using terraform modules which will be addressed in further commits.
