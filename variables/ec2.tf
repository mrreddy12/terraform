
#  scenario---create instance without variable and with variable aloing with security group 
#and verify in console creted or not



resource "aws_instance" "roboshop" {
  //ami           = "ami-09c813fb71547fc4f"  //wihtou out variable
  ami           =  var.ami_id  //with vairable
  instance_type = "t3.micro"
  
  //resourcetype.resourncename.id ..creted security group below...spec
  vpc_security_group_ids = [aws_security_group.allow_all.id]  // its list...so used [  
  tags = {
    Name = "mongo"  //instance name
  }
}

#  first...security group create..run it and verify 
resource "aws_security_group" "allow_all" {
    name        = "allow_all"  #giving name to security group--

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