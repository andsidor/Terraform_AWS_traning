resource "aws_vpc" "mtc_main" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "mtc_public_subnet" {
  vpc_id                  = aws_vpc.mtc_main.id
  cidr_block              = "10.123.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public"
  }
}


resource "aws_internet_gateway" "mtc_igw" {
  vpc_id = aws_vpc.mtc_main.id
  tags = {
    Name = "dev_igw"
  }
}

resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_main.id
  tags = {
    Name = "dev_public_rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.mtc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mtc_igw.id

}

resource "aws_route_table_association" "mtc_public_assoc" {
  subnet_id      = aws_subnet.mtc_public_subnet.id
  route_table_id = aws_route_table.mtc_public_rt.id
}
resource "aws_key_pair" "mtc_auth" {
  key_name   = "mtc_key"
  public_key = file("~/.ssh/mtckey.pub")
}
resource "aws_instance" "mtc_node" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.server_ami.id
  vpc_security_group_ids = [aws_security_group.mtc_sg.id]
  subnet_id     = aws_subnet.mtc_public_subnet.id

    tags = {
        Name = "dev_node"
    }
    key_name = aws_key_pair.mtc_auth.id


    root_block_device {
      volume_size = 10
    }
    
}
