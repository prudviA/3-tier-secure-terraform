module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "../../modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id = module.security.alb_sg_id
}

module "ec2" {
  source = "../../modules/ec2"
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id = module.vpc.private_subnet_ids[0]
  sg_id = module.security.ec2_sg_id
}

module "rds" {
  source = "../../modules/rds"
  db_instance_class = "db.t3.micro"
  db_user = "admin"
  db_pass = "password123"
  subnet_ids = module.vpc.private_subnet_ids
  sg_id = module.security.ec2_sg_id
}

