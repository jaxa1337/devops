resource "aws_key_pair" "jakub_kabat" {
  key_name   = "jakub.kabat"
#   public_key = file("~/.ssh/id_ecdsa.pub")
#   public_key = file("~/.ssh/test.pub")
  public_key = "PUB_KEY"
  tags = {
    "encryption" = "ecdsa"
  }
}