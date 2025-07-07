resource "aws_instance" "bastion" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "your-key"
  tags = {
    Name = "bastion"
  }

  user_data = file("bootstrap.sh")
}

resource "aws_s3_bucket" "example" {
  bucket = "my-gitops-terraform-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name        = "GitOpsBucket"
    Environment = "Dev"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
