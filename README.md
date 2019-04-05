## Introduction

This repo contains artifacts which uses the IaC tool Terraform to deploy a simple application in an EC2 instance in AWS.

The deployment in AWS is self contained, which means the whole application will be deployed into it's own VPC (private network in AWS) with all the affiliated infrastructure artifacts in AWS.

The application is written in NodeJS using REST which, when called with an end-point will reply with a simple (st atic) message and a timestamp.

Once verified, the whole infrastructure can be destroyed with a simple command.

## Quick start

[Install Terraform](https://www.terraform.io/intro/getting-started/install.html).

Clone the repository for the code from here: https://github.com/edwardpius/awsTemplate.git.

After downloading the code the structure of your folder will look as follows:

  ```
    ├── README.md
    ├── api-routes.js
    ├── index.js
    ├── node_modules
    │   └── ajv
    │       └── lib
    ├── package-lock.json
    ├── package.json
    ├── spec
    │   ├── api.spec.js
    │   └── hello.spec.js
    └── terraform
        ├── 01-network.tf
        ├── 05-routing-and-network.tf
        ├── 10-subnets.tf
        ├── 20-security-groups.tf
        ├── 50-ec2.tf
        ├── outputs.tf
        ├── terraform.tfvars
        └── variables.tf
  ```

Fill in the appropriate values for your environment in the `terraform.tfvars` file (contents shown below). The following fields require values to be filled in: aws_access_key, aws_secret_key, whitelist_ips, and instance_key.

  ```
    aws_region = "us-east-1"
    aws_access_key = "<AWS_KEY>"
    aws_secret_key = "<AWS_SECRET>"
    ami_linux_images = {
        us-east-1 = "ami-b73b63a0"
        us-west-2 = "ami-5ec1673e"
        eu-west-1 = "ami-9398d3e0"
    }
    vpc_cidr = "172.28.0.0/16"
    subnet_public_AzA_cidr = "172.28.1.0/24"
    whitelist_ips = ["<whitelist IPs>"]
    instance_user_home = "/home/ec2-user"
    instance_key = "<SSH Private Key for EC2 instance>"
  ```

Go into the terraform and run the following commands:

  ```bash
    terraform init
    terraform plan
    terraform apply
  ```

  Answer 'yes' for the 'terraform apply' command

Once the configuration is complete, note the value of the output field `nodeapp_public_ip`.

Open a browser and enter http://<nodeapp_public_ip>:4000/api. You should see an output similar to the following:

  ```
    {
        "message": "Automation for the People",
        "timestamp": 1554394345667
    }
  ```

## Running Unit Tests

Unit tests for this application can be run from either the local environment or from the instance which was spun up in AWS.

Running from the local environment:

  ```
    Clone the repo as above
    Make sure that Node is installed
    Run npm install jasmine-node
    Run npm install request
    Update the value of the public IP in the api_spec.js file for both the variables
    Run node_modules/.bin/jasmine-node spec
  ```

Running from the EC2 instance:

  ```
    SSH into the EC2 instance
    Run npm install jasmine-node
    Run npm install request
    Update the value of the public IP in the api_spec.js file for both the variables
    Run node_modules/.bin/jasmine-node spec
  ```

## Deleting the configuration

Just run `terraform destroy` to delete all the infrastructure components in AWS.