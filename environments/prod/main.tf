module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
}

module "ec2" {
  source        = "../../modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnet_ids[0]
  sg_id         = module.security.ec2_sg_id
}

module "rds" {
  source           = "../../modules/rds"
  db_instance_class = var.db_instance_class
  db_user          = var.db_user
  db_pass          = var.db_pass
  subnet_ids       = module.vpc.private_subnet_ids
  sg_id            = module.security.ec2_sg_id
}

