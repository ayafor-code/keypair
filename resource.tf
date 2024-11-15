# Resource: EC2 Instance
resource "aws_instance" "myec2" {
  ami           = var.my-ami
  instance_type = var.instance-type["uat"]
  user_data     = file("${path.module}/tla.sh")
  key_name      = aws_key_pair.tf-key.key_name

  tags = {
    "Name" = var.instance-name
  }
}

resource "aws_key_pair" "tf-key" {
  key_name   = "tlakey"
  public_key = file("tlakey.pub")
}


