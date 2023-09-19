resource "aws_lightsail_instance" "my-lightsail-instance" {
  name              = "my-lightsail-instance"
  
  bundle_id = "nano_2_0"


  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}



