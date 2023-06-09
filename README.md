# cloud-testing-construction-kit

Cloud Testing Construction Kit is a collection of Terraform files and related instruction that allow integration developers to:

1. Create cloud resources needed for development or testing the integrations.
2. Use the resources to created metrics and/or logs.
3. Tear down everything when you are done.

## Requirements

- Terraform 1.4.x
- AWS CLI

## Getting Started

In this getting starte guide, we will create a SQS queue to collect metrics using the recipe at `aes/sqs/simple`.

```shell
cd aws/sqs/simple

export AWS_PROFILE="<your-profile-name>"

terraform init

export TF_VAR_owner="mbranca" 

terraform plan

terraform apply

```

Now you can use the instructions at `aws/sqs/simple/README.md` to send, receive, and delete SQS messages to generate metrics.
