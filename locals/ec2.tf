resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = local.instnace_type
  vpc_security_group_ids =[aws_security_group.allow_all.id]
  tags =local.ec2_tags
}
resource "aws_security_group" "allow_all" {
  name   = "${local.common_name} -allow-all"


 

  egress  {
    from_port        = var.egress_from_port  # from port 0 to to port 0 means all ports
    to_port          = var.egress_to_port
    protocol         = var.protocol # -1 means all protocols
    cidr_blocks      = var.cidr #internet
    
  }
   ingress  {
    from_port        = var.ingress_from_port  # from port 0 to to port 0 means all ports
    to_port          = var.ingress_to_port
    protocol         = var.protocol # -1 means all protocols
    cidr_blocks      = var.cidr #internet
    
  }
  tags = var.sg_tags
}