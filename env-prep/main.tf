variable "region" {
    type = string
    default = "us-east-1"
}

provider "aws" {
    profile = "default"
    region = var.region 
}
resource "aws_db_instance" "masterclass-db" {
    allocated_storage = 20
    storage_type = "gp2"
    engine  = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    identifier = "masterclass-db"
    name = "TitoDB"
    username = "admin"
    password = "VMware1!"
}