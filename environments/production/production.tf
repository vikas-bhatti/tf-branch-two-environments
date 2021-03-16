variable "environment" {
}
variable "region" {
}
variable "ami_id" {
}
variable "access_key" {
  description = "The access key for the cloud user"
  type        = string
  sensitive = true
}

variable "secret_key" {
  description = "The secret key for the cloud user"
  type        = string
  sensitive = true
}
#Ideally you wouldn't provide your keys in terraform, running 'aws configure' or setting environment variables is a better and more secure alternative
provider "aws" {
   region = var.region
   version = "~> 2.7"
   access_key = var.access_key
   secret_key = var.secret_key
}
module "infrastructure" {
   source      = "../../modules/infrastructure"
   environment = var.environment
   region      = var.region
   ami_id      = var.ami_id
}
