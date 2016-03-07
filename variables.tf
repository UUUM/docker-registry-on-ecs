variable "aws_access_key" {
    description = "AWS access key"
}

variable "aws_secret_key" {
    description = "AWS secret access key"
}

variable "aws_region" {
    description = "AWS region"
}

variable "s3_bucket_name" {
    description = "s3 bucket name"
}

variable "ecs_optimized_ami_id" {
    description = "ecs-optimized ami id"
}

variable "htpasswd" {
    description = "htpasswd -cB htpasswd [username]"
}
