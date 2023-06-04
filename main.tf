terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

//region 설정
provider "aws" {
  profile = "default"
  region = "ap-northeast-2"
}