#Basic Stuff for AWS
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "aws_vpc" {}
#Used for whitelisting AWS Resources
variable "aws_ec2_endpoint_sg" {}
variable "aws_elb_endpoint_sg" {}
variable "aws_s3_endpoint_sg" {}

variable "internal_cidr" {}

#Other PCF Stuff
variable "env_name" {}
variable "cells_allow_all_internal" {}
variable "router_ingress_cidr" {}
variable "router_allow_http" {}
variable "pas_nlb_cidr_blocks" {
  type = "list"
}

#Ops Manager
variable "om_ingress_cidr" {}
variable "om_egress" {}
