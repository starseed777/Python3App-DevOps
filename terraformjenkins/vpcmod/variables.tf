variable "vpc_cidr" {
    type = "string"
    default = "10.0.0.0/16"
}

variable "publicsubnetcidr" {
    type = "string"
    default = "10.0.1.0/24"
}

variable "public_ip" {
  type        = "string"
  default     = "0.0.0.0/0"
}

variable "aws_region" {
    type = "string"
    default = "us-east-1"
}

variable "aws_image" {
    type = "string"
    default = "ami-0533f2ba8a1995cf9"
}

variable "aws_instance_type" {
    type = "string"
    default = "t2.micro"
}

variable "aws_key" {
    type = "string"
    default = "starseed"
}