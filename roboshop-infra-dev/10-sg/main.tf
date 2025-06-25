

#front end
module "frontend" {

    #source = "git::https://github.com/daws-84s/terraform-aws-securitygroup.git?ref=main"
       source = "../../modules-/terraform-aws-securitygroup"
    project = var.project
    environment = var.environment

    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    #vpc_id = data.aws_ssm_parameter.vpc_id.value  ...store this in local and get it from local
    vpc_id = local.vpc_id
}