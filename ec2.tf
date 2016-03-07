resource "aws_instance" "docker-registry" {
    ami = "${var.ecs_optimized_ami_id}"
    instance_type = "t2.micro"
    tags {
        Name = "Docker Registry"
    }
    security_groups = ["${aws_security_group.docker-registry.name}"]
    iam_instance_profile = "${aws_iam_instance_profile.docker-registry.name}"
    user_data = <<EOF
#!/bin/bash

echo ECS_CLUSTER=docker-registry >> /etc/ecs/ecs.config
mkdir /auth
echo "${var.htpasswd}" > /auth/htpasswd
EOF
}

resource "aws_security_group" "docker-registry" {
    name = "docker-registry"
    description = "Docker Registry"

    ingress {
        from_port = 5000
        to_port = 5000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "Docker Registry"
    }
}
