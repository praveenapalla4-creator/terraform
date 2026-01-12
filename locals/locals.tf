locals{
    instnace_type="t3.micro"
    common_name ="${var.project}-${var.environmnent}"
    ec2_tags =merge(
    var.common-tags,{
      Name= "${local.common_name} -local-demo"
    }
  )
}