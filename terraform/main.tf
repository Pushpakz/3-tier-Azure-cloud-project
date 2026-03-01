module "rg" {
  source = "./modules/rg"
  name   = var.resource_group_name
  location = var.location
}

module "acr" {
  source = "./modules/acr"
  name   = var.acr_name
  rg_name = module.rg.name
  location = var.location
}

module "aks" {
  source = "./modules/aks"
  name   = var.aks_name
  rg_name = module.rg.name
  location = var.location
}