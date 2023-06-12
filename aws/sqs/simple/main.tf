terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.4.0"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      division = "engineering"
      org      = "obs"
      team     = "obs-infra-platform"
      project  = var.owner
    }
  }
}

resource "aws_sqs_queue" "example_queue" {
  name                       = "${var.owner}-example-queue"
  visibility_timeout_seconds = 10
}
