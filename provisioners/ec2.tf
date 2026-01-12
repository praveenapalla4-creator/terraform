resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids =[aws_security_group.allow_all.id]
  tags = {
    Name = "terraform"
    Terraform="true"

  }
  provisioner "local-exec"{
    command = "echo ${self.private_ip} > inventory"
    on_failure= continue
  } #by deafualt creation time lo run avthundhi destroy time lo run avvali ante  when== destroy
   provisioner "local-exec"{
    command = "echo Instance destroyed"
     when = destroy
   }
   # Connection block for SSH
connection {
type = "ssh"
user = "ec2-user"
password = "DevOps321"
host = self.public_ip
}
# Remote-exec provisioner to run commands on the server
  provisioner "remote-exec" {
inline = [
    "sudo dnf install nginx -y ",
    "sudo systemctl start nginx"
]
}

provisioner "remote-exec" {
inline = [
    "sudo systemctl stop nginx",
    "echo 'succesfully stooped nginx server"
]
 when = destroy
}
} 
resource "aws_security_group" "allow_all" {
  name   = "allow-all"


 
  egress  {
    from_port        = 0  # from port 0 to to port 0 means all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] #internet
    
  }
   ingress  {
    from_port        = 0  # from port 0 to to port 0 means all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] #internet
    
  }
  tags={
    Name ="allow-all"
  }
}