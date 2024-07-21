locals{
    project_name = "ecs-learn"
    stage = "develop"
    region = "us-east-1"
    availability_zone = "us-east-1a"
    # DBの設定
    db_port = 3306
    db_username = "admin"
    db_name = "ecs-learn-db"
    # シークレット設定
    secret_stage = "DEVELOP"
}