provider "aws" {
  shared_config_files      = ["$HOME/.aws/conf"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = "custom"
  region                   = "us-east-2"
}
resource "aws_instance" "brainstorm" {
  ami                    = "ami-0ea3c35c5c3284d82"
  key_name               = "login_from_terraform"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.brainstorm.id]
  user_data              = file("prerequisite.sh")
  tags = {
    name  = "Web-Server Built with Terraform"
    owner = "Anurag Singh Pundir"
  }

  provisioner "file" {
    source      = "~/.ssh/id_ed25519.pub"
    destination = "/home/ubuntu/id_ed25519.pub"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file("login_from_terraform.pem")
    }
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu/",
      "cat id_ed25519.pub >> authorized_keys",
      "exit"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file("login_from_terraform.pem")
    }
  }

}

resource "aws_security_group" "brainstorm" {
  name        = "webserver-sg"
  description = "security group for my webserver"
  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      description = "Allow Port HTTP"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  ingress {
    description = "Allow Port SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port MySql"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}