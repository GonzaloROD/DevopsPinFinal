# Configuración del Backend para almacenar el estado en S3
terraform {
  backend "s3" {
    bucket = "mi-bucket-terraform-state-12345"   # Nombre del bucket S3
    key    = "terraform.tfstate"                 # Nombre del archivo de estado dentro del bucket
    region = "us-east-1"                         # Región de AWS donde se encuentra el bucket S3
    encrypt = true                              # Activar cifrado para el archivo de estado
    acl     = "bucket-owner-full-control"        # Permite control total al propietario del bucket
  }
}

# Crear y lanzar una instancia webserver en AWS
resource "aws_instance" "webserver" {
  ami                         = "ami-0866a3c8686eaeeba"   # ID de la AMI
  instance_type               = "t2.micro"                # Tipo de instancia EC2
  #key_name                    = app-ssh-key 
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  user_data                   = "${file("Contenedores.sh")}"

  tags = {
    Name = "webserver"
  }
}