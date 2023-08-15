data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "hello.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "myLambda" {
  filename         = "lambda_function.zip"
  function_name    = var.function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "hello.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  vpc_config {
    subnet_ids = module.vpc.public_subnets
    security_group_ids = [aws_security_group.lambdasss.id]
  }
  #module.vpc.public_subnets[0]

  # # network_configuration {
  # #   security_groups  = [aws_security_group.SonarQube.id]
  # #   subnets          = module.vpc.public_subnets
  # #   assign_public_ip = true
  # # }

# vpc_config {
#   subnet_ids = ["${split(",", var.subnet_ids)}"]
#   security_group_ids = ["${var.security_group_ids}"]
# }


}




resource "aws_iam_policy" "lambda_policy" {
  name = aws_lambda_function.myLambda.function_name
  # policy = file("policy.json")
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:CreateNetworkInterface",
				"ec2:DeleteNetworkInterface",
				"ec2:AttachNetworkInterface"
			],
			"Resource": [
				"arn:aws:ec2:*:${var.accountId}:security-group/*",
				"arn:aws:ec2:*:${var.accountId}:network-interface/*",
				"arn:aws:ec2:*:${var.accountId}:subnet/*",
				"arn:aws:ec2:*:${var.accountId}:instance/*"
			]
		},
		{
			"Sid": "VisualEditor1",
			"Effect": "Allow",
			"Action": [
				"ec2:DescribeInstances",
				"ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
			],
			"Resource": "*"
		},
  		{
			"Sid": "VisualEditor2",
			"Effect": "Allow",
			"Action": [
        "logs:PutLogEvents"
        ],
			"Resource": [
        "arn:aws:logs:${var.aws_region}:${var.accountId}:log-group:/aws/lambda/${var.function_name}:*:*"
        ]

		},
		{
			"Sid": "VisualEditor3",
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogStream",
				"logs:CreateLogGroup"
			],
			"Resource": [
        "arn:aws:logs:${var.aws_region}:${var.accountId}:log-group:/aws/lambda/${var.function_name}*"
        ]
		}
	]
}
EOF
  
}


resource "aws_iam_role" "lambda_role" {
  name = "role_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}





resource "aws_cloudwatch_log_group" "lambdavpc" {
  name = "/aws/lambda/${var.function_name}"
  retention_in_days = 7
  
}



# aws lambda invoke --function-name firstFunction outfile



  # network_configuration {
  #   security_groups  = [aws_security_group.SonarQube.id]
  #   subnets          = module.vpc.public_subnets
  #   assign_public_ip = true
  # }