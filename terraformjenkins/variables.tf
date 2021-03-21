variable "aws_region" {
  type    = "string"
  default = "us-east-1"
}

variable "s3_backend" {
  type    = "string"
  default = "backupjawnt"
}

variable "dynamo_backend" {
  type    = "string"
  default = "dynamojawnt"
}