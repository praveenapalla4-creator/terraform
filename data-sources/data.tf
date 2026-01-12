data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
     most_recent      = true

      filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

data "aws_instance" "mysql" {

 instance_id ="i-0c7908770327e5aff"

 
}
output "mysql"{
   value= data.aws_instance.mysql.public_ip
} 
output "ami_id"{
   value= data.aws_ami.joindevops.id
} 