variable "REGION" {
  default = "us-east-1"
}

variable "KEY_NAME" {
  default = "musipedia-backend-key"
}

variable "PUBLIC_KEY" {
  type    = string
  default = "mb.pub"
}

variable "KEY_PAIR_NAME" {
  type    = string
  default = "musipedia-backend"
}

variable "PRIVATE_KEY" {
  type    = string
  default = "musipedia-backend"

}


variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0ae04266c242a534b"
  }
}


variable "PROJECT_NAME" {
  type    = string
  default = "musipedia"

}


variable "INSTANCE_TYPE" {
  type    = string
  default = "t2.micro"

}



