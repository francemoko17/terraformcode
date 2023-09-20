resource "aws_lightsail_instance" "my-lightsail1-instance" {
  name              = "my-lightsail1-instance"

  blueprint_id = "centos_7"
  bundle_id = "nano_2_0"


  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y 
    sudo yum install unzip wget httpd -y  ( apt install wget unzip -y )
    sudo wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
    sudo unzip main.zip
    sudo rm -rf /var/www/html/*
    sudo cp -r static-resume-main/* /var/www/html/  (cp -r static-resume-main/iPortfolio/* /usr/local/apache2/htdocs/)
    sudo systemctl start httpd
    sudo systemctl enable httpd 
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}