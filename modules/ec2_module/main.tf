resource "aws_security_group" "AmatipIT_sg" {
    vpc_id = var.vpc_id
    name = "AmatipIT_sg"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.ingress_sg_cidr_block]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.ingress_sg_cidr_block]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.ingress_sg_cidr_block]
        prefix_list_ids = []
    }
}


 resource "aws_key_pair" "AmatipIT_server_key" {
  key_name   = "AmatipIT-server-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpinV11FT3Ln1YRnps++oqZq5b8qPBo0uS6GRbbjlpLwWpoMEbESPNpTcZnvu27TVXnUt8JNqT9iIEnM+QPtaYl6d3Lu0r2dxTBejoCFG61InrenyGlPrXb7qGyowcg9/Ld3in/Nqh2BcykM+glnZLdMjxhIGEWaDFcWnALZVxnPxZpfStwuFfRw8qyi+EXy4OVpOEOBBi5G/G/z+vTGZtyCZQtNKIKGBVblfP8JKOd5A0XcSlp7ZyIIoritbctoJNms2WhjM+qXNTK7hSIzfObaj82qM2hRRT/aOvnxE8/1lJqUz2vAk7xIbRom5Cmb7z5HYyIwKOc/au5+ozAfM78fkDKdDy2NrBEbbEVrQed0DnehD5GylOnBhn9HZW8JIN7nq7iOHkjluN8xDSOF1+75fiteshrCOnLpWD4ZGtbKODi4cwTIZ6/AuhAFFsqGYzDd3MwRUjrqoW10vKN9yL/nLcO0AG515S3NHld78PcT+FHUrE9PWJQ6E5DTfvTAM= engr_king@engr"
}


resource "aws_instance" "AmatipIT_server" {
  ami = data.aws_ami.ubuntu.id
  key_name = "AmatipIT-server-key"
  vpc_security_group_ids = [aws_security_group.AmatipIT_sg.id]
  instance_type = var.instance_type
  subnet_id =  var.subnet_id

  associate_public_ip_address = true
  tags = {
    Name = "${local.prefix}-server"
  }
  user_data = file("./script.sh")
}

resource "aws_ec2_instance_connect_endpoint" "example" {
  subnet_id = var.subnet_id
}

resource "aws_db_instance" "AmatipIt_db" {
  allocated_storage    = 10
  db_name              = "AmatipIT_db"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "AmatipIT_user"
  password             = "examplepassword"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

#  add this in ec2 main.tf file