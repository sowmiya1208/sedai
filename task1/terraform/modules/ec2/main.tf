resource "aws_instance" "nginx" {
  count         = 2
  ami           = "ami-0c8ccc1f635f83770"
  instance_type = "t2.micro"
  security_groups = [var.security_group_id]
  subnet_id     = var.subnet_id
  key_name = "sedai-keypair"
  user_data = <<EOF
#!/bin/bash
ansible-playbook -i localhost, -c local /home/ec2-user/install_nginx.yml
EOF

  tags = {
    Name = "${var.name}-nginx-${count.index + 1}"
  }
}