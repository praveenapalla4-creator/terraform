variable "instances" {
   default= {
        mongodb ="t3.micro"
        mysql= "t3.small"
        redis ="t3.micro"
        rabbitmq ="t3.micro"
}
   }
variable "zone_id"{
    default= "Z0398365AXZ3ME1MH9EB"
}
variable "domain_name"{
    default= "daws86s.help"
}