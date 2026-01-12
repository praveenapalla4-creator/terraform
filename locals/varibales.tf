variable "project"{
  default="robohsop"
}

variable "environmnent"{
  default ="dev"
}
# variable "common_name"{
#   default="${var.project}.${var.environmnent}"
# }
#Error: Variables not allowed

# │   on varibales.tf line 9, in variable "common_name":
# │    9:   default="${var.project}.${var.environmemn}"
# │
# │ Variables may not be used here.
# ╵
# ╷
# │ Error: Variables not allowed
# │
# │   on varibales.tf line 9, in variable "common_name":
# │    9:   default="${var.project}.${var.environmemn}"
# │
# │ Variables may not be used here.


variable "ami_id" {
    type = string #  type mandatory kadhu but incase user ne vale ivvamnate vallaki type of varibale teliyali so type mention for example sg .key names diff untay so evaryina github nundi reuse chesinappudu vallaki telusthundhi idhi string or map or any other type 
    default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  
  type = string
  default     = "t3.micro"
}
variable "common-tags" {
  
  type = map
  default     = {
    Terraform= true
    Project = "roboshop"
    Environment = "dev"
  }
}
variable "sg_name" {
  
  type = string
  default     = "allow_all"
  description = "secuirty group name to attch to ec2 isntance " # optionl
}

variable "cidr" {
    
    default = ["0.0.0.0/0"]

}
variable "ingress_from_port" {
    
    default = 0

}
variable "ingress_to_port" {
    
    default = 0

}
variable "egress_from_port" {
    
    default = 0

}
variable "egress_to_port" {
    
    default = 0

}

variable "protocol"{
    default="-1"
}

variable "sg_tags"{
    default = {
    Name ="allow-all"
    }
}