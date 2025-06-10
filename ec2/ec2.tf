# resource "aws_instance" "roboshop" {
#   ami           = "ami-09c813fb71547fc4f"
#   instance_type = "t3.micro"
#   #vpc_security_group_ids = [ aws_security_group.allow_all.id ]
#   vpc_security_group_ids = local.sg_id
#   tags = {
#     Name = "HelloWorld"
#   }
# }

#  first
resource "aws_security_group" "allow_all" {
    name        = "allow_all"  #giving name to security group--manually we select from dropdown
    description = "allow all traffic"   #optional

   #inbound rules .. allow all means from port ...to port 0 to 0 protocol -1
    ingress {
        from_port        = 0  #all
        to_port          = 0  #all
        protocol         = "-1"  # -1 means all ports..all traffic
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    #outbound rules
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-all"
    }
}