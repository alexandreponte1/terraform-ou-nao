# resource "aws_cognito_user_pool" "this" {
#   name                     = var.service_name
#   username_attributes      = ["email"]
#   auto_verified_attributes = ["email"]

#   verification_message_template {
#     default_email_option = "CONFIRM_WITH_CODE"
#   }
#   account_recovery_setting {
#     recovery_mechanism {
#       name     = "verified_email"
#       priority = 1
#     }
#     recovery_mechanism {
#       name     = "verified_phone_number"
#       priority = 2
#     }
#   }

#   password_policy {
#     minimum_length    = 6
#     require_lowercase = false
#     require_numbers   = false
#     require_symbols   = false
#     require_uppercase = false
#   }

# # Custom attribute
#   schema {
#     attribute_data_type      = "String"
#     developer_only_attribute = false
#     mutable                  = true
#     name                     = "email"
#     required                 = true

#     string_attribute_constraints {
#       min_length = 7
#       max_length = 256
#     }
#   }

#   # schema {
#   #   attribute_data_type      = "String"
#   #   developer_only_attribute = false
#   #   mutable                  = true
#   #   name                     = "cpf"
#   #   required                 = true

#   #   string_attribute_constraints {
#   #     min_length = 7
#   #     max_length = 16
#   #   }
#   # }



#   tags = merge(local.common_tags, { Name = "Cognito-${var.env}" })
# }

# resource "aws_cognito_user_pool_client" "this" {
#   name         = var.service_name
#   user_pool_id = aws_cognito_user_pool.this.id

#   generate_secret                      = true
#   allowed_oauth_flows                  = ["implicit"]
#   allowed_oauth_flows_user_pool_client = true
#   allowed_oauth_scopes                 = ["openid"]
#   callback_urls                        = ["http://localhost:3000"]
#   supported_identity_providers         = ["COGNITO"]
# }

# # app cliente para app novo.
# resource "aws_cognito_user_pool_client" "app" {
#   name         = var.app_name
#   user_pool_id = aws_cognito_user_pool.this.id

#   generate_secret                      = false
#   allowed_oauth_flows                  = ["implicit"]
#   explicit_auth_flows                  = ["ALLOW_USER_SRP_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
#   allowed_oauth_flows_user_pool_client = true
#   allowed_oauth_scopes                 = ["openid"]
#   callback_urls                        = ["http://localhost:9000"]
#   supported_identity_providers         = ["COGNITO"]
# }


# resource "aws_cognito_user_pool_domain" "this" {
#   domain       = var.service_domain
#   user_pool_id = aws_cognito_user_pool.this.id
# }

# resource "aws_cognito_identity_pool" "this" {
#   identity_pool_name               = var.service_name
#   allow_unauthenticated_identities = false

#   cognito_identity_providers {
#     client_id     = aws_cognito_user_pool_client.this.id #aws_cognito_user_pool_client.app.id
#     provider_name = aws_cognito_user_pool.this.endpoint

#   }
# }

# #Roles

# #authenticated

# resource "aws_iam_role" "authenticated" {
#   name = "${var.service_name}_cognito_authenticated"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "cognito-identity.amazonaws.com"
#       },
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.this.id}"
#         },
#         "ForAnyValue:StringLike": {
#           "cognito-identity.amazonaws.com:amr": "authenticated"
#         }
#       }
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_role_policy" "authenticated" {
#   name = "authenticated_policy"
#   role = aws_iam_role.authenticated.id

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "mobileanalytics:PutEvents",
#         "cognito-sync:*",
#         "cognito-identity:*"
#       ],
#       "Resource": [
#         "*"
#       ]
#     }
#   ]
# }
# EOF
# }

# #unauthenticated

# resource "aws_iam_role" "unauthenticated" {
#   name = "${var.service_name}_cognito_unauthenticated"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "cognito-identity.amazonaws.com"
#       },
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.this.id}"
#         },
#         "ForAnyValue:StringLike": {
#           "cognito-identity.amazonaws.com:amr": "unauthenticated"
#         }
#       }
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_role_policy" "unauthenticated" {
#   name = "unauthenticated_policy"
#   role = aws_iam_role.unauthenticated.id

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "mobileanalytics:PutEvents",
#         "cognito-sync:*",
#         "cognito-identity:*"
#       ],
#       "Resource": [
#         "*"
#       ]
#     }
#   ]
# }
# EOF
# }

# resource "aws_cognito_identity_pool_roles_attachment" "this" {
#   identity_pool_id = aws_cognito_identity_pool.this.id
#   roles = {
#     "authenticated"   = aws_iam_role.authenticated.arn
#     "unauthenticated" = aws_iam_role.unauthenticated.arn
#   }
# }