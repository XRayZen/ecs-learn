



resource "aws_ecs_cluster_capacity_providers" "provider" {
  cluster_name       = aws_ecs_cluster.terafform_cluster.name
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
}


resource "aws_ecs_capacity_provider" "test" {
  name = "test"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.test.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      maximum_scaling_step_size = 1000
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 10
    }
  }
}


resource "aws_ecs_cluster" "foo" {
  name = "${var.ecs_cluster_name}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

