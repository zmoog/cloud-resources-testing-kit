# cloud-testing-construction-kit

Cloud Testing Construction Kit is a collection of Terraform files and related instruction that allow integration developers to:

1. Create cloud resources needed for development or testing the integrations.
2. Use the resources to created metrics and/or logs.
3. Tear down everything when you are done.

## Requirements

- Terraform 1.4.x
- AWS CLI

## Getting Started

In this getting started guide, we will use a simple recipe at `aes/sqs/simple` to collect metrics from a SQS queue.

### 1. Create cloud resources needed for development or testing the integrations

First, walk into the recipe folder:
```shell
cd aws/sqs/simple
```

Set up your credentials to access AWS; in this example, we will use the credentials stored in a profile called `testing`:

```shell
export AWS_PROFILE="testing"
```

Every cloud resource must have an owner!

```shell
export TF_VAR_owner="mbranca" 
```

Initialize Terraform and and get a preview of the resources that Terraform will create for you, if you decide to apply them:

```shell
terraform init

terraform plan
```

After a careful review, you decide to move forward and create the resources:

```shell
terraform apply
```

### 2. Use the resources to created metrics and/or logs

Now you can use the instructions at `aws/sqs/simple/README.md` to send, receive, and delete SQS messages to generate metrics.


### 3. Tear down everything when you are done

You're not done yet!

Don't forget to tear down everything you created to avoid accidental expenses:

```shell
terraform destroy
```