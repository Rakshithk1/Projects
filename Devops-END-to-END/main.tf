# main.tf
provider "aws" {
  region = "us-east-1"
  profile = "myaws"  
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"

  tags = {
    Name = "MyEC2Instance"
  }

  key_name = "ans"
}

