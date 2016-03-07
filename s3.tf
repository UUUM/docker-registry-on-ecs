resource "aws_s3_bucket" "docker-registry" {
    bucket = "${var.s3_bucket_name}"
    acl = "private"
}
