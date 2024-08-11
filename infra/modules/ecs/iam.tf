
# 上記でCloud Watch Logをログ記録用に作成したり、Docker ImageをPullしたりするときに、Cloud Watch や　ECRにアクセスするための権限が必要になる。
# この権限をECS Container Agentに付与しなければならない。
# https://qiita.com/s_yanada/items/e9c6c096b5df7f6c7bf1#2-ecs-on-fargate
### IAM Role ###
resource "aws_iam_role" "ecs_task_execution_role" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ecs-tasks.amazonaws.com"
          }
          Sid = ""
        },
      ]
      Version = "2012-10-17"
    }
  )
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
  ]
  description = "Allows ECS tasks to call AWS services on your behalf."
  name        = "ecsTaskExecutionRole"
  path        = "/"
}
