
include "root" {
    path= find_in_parent_folders()
}

locals{
    env= read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform{
    source = "../../../modules/ecr"
}

inputs ={
    project_name = local.env.locals.project_name
    repository_name = "${local.env.locals.project_name}_repo"
}