



resource "aws_ecs_task_definition" "hello_app" {
  family                   = "hello-app-task-definition"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = <<JSON
  [
    {
      "name": "hello-app",
      "image": "${var.ecr_address}/hello-app:${var.hello_app_image_tag}",
      "essential": true,
      "portMappings": [
        {
          "protocol": "tcp",
          "containerPort": 8080
        }
      ],
      "environment": ${jsonencode(var.container_environment)}
    }
  ]
  JSON
}
