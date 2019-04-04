[![Maintained by Gruntwork.io](https://img.shields.io/badge/maintained%20by-gruntwork.io-%235849a6.svg)](https://gruntwork.io/?ref=repo_terragrunt)
[![Go Report Card](https://goreportcard.com/badge/github.com/gruntwork-io/terragrunt)](https://goreportcard.com/report/github.com/gruntwork-io/terragrunt)
[![GoDoc](https://godoc.org/github.com/gruntwork-io/terragrunt?status.svg)](https://godoc.org/github.com/gruntwork-io/terragrunt)

# Terragrunt

Terragrunt is a thin wrapper for [Terraform](https://www.terraform.io/) that provides extra tools for keeping your Terraform configurations DRY, working with multiple Terraform modules, and managing remote state.


## Quick start

1. [Install Terraform](https://www.terraform.io/intro/getting-started/install.html).

1. Clone the repository for the code from here: https://github.com/edwardpius/awsTemplate.git.

1. After downloading the code the structure of your folder will look as follows:

```
├── api-routes.js
├── index.js
├── node_modules
│   └── ajv
│       └── lib
├── package-lock.json
├── package.json
├── spec
│   ├── README.md
│   ├── api.spec.js
│   └── hello.spec.js
└── terraform
    ├── 01-network.tf
    ├── 05-routing-and-network.tf
    ├── 10-subnets.tf
    ├── 20-security-groups.tf
    ├── 50-ec2.tf
    ├── outputs.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
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

