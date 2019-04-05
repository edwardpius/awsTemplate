##Introduction

1. This repo contains artifacts which uses the IaC tool Terraform to deploy a simple application in an EC2 instance in AWS.

1. The deployment in AWS is self contained, which means the whole application will be deployed into it's own VPC (private network in AWS) with all the affiliated infrastructure artifacts in AWS.

1. The application is written in NodeJS using REST which, when called with an end-point will reply with a simple (st atic) message and a timestamp.

1. Once verified, the whole infrastructure can be destroyed with a simple command.

## Quick start

1. [Install Terraform](https://www.terraform.io/intro/getting-started/install.html).

1. Clone the repository for the code from here: https://github.com/edwardpius/awsTemplate.git.

1. After downloading the code the structure of your folder will look as follows:

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

1. Fill in the appropriate values for your environment in the `terraform.tfvars` file. The following fields require values to be filled in: aws_access_key, aws_secret_key, whitelist_ips, and instance_key.

1. Go into the terraform and run the following commands:

    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

   Answer 'yes' for the 'terraform apply' command

1. Once the configuration is complete, note the value of the output field `nodeapp_public_ip`.

1. Open a browser and enter http://<nodeapp_public_ip>:4000/api. You should see an output similar to the following:

```
  {
      "message": "Automation for the People",
      "timestamp": 1554394345667
  }
```

## Running Unit Tests

1. Unit tests for this application can be run from either the local environment or from the instance which was spun up in AWS.

1. Running from the local environment:

```
Clone the repo as above
Make sure that Node is installed
Run npm install jasmine-node
Run npm install request
Update the value of the public IP in the api_spec.js file for both the variables
Run node_modules/.bin/jasmine-node spec
```

1. Running from the EC2 instance:

```
SSH into the EC2 instance
Run npm install jasmine-node
Run npm install request
Update the value of the public IP in the api_spec.js file for both the variables
Run node_modules/.bin/jasmine-node spec
```

## Deleting the configuration

1. Just run `terraform destroy` to delete all the infrastructure components in AWS.