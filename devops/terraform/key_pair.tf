# provision key 


data "aws_s3_object" "public_key_object" {
  bucket = "musipedia-secretes"
  key    = "mb.pub"
}


resource "aws_key_pair" "musipedia-backend-key" {
  key_name   = var.KEY_PAIR_NAME
  public_key = data.aws_s3_object.public_key_object.body
}

# print out some output
output "key_name" {
  value = aws_key_pair.musipedia-backend-key.key_name
}