module "dev" {
  source = "./Dev"
  rgs    = var.rgs
}

module "prod" {
  source = "./Prod"
  rgs    = var.rgs
}
