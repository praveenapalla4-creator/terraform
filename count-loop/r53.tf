resource "aws_route53_record" "roboshop" {
    count =4
  zone_id = "${var.zone_id}"
  name    = "${var.instances[count.index]}.${var.domain_name}" #"interpolation- concatinating variable and string"
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite=true
}

# resource "aws_route53_record" "frontend" {
#     count =aws_instance.terraform[count.index]
#   zone_id = "${var.zone_id}"
#   name    = "${var.instances[count.index]}.${var.domain_name}" #"interpolation- concatinating variable and string"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.terraform[count.index].public_ip]
#   allow_overwrite=true
# }