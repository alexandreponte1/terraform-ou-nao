resource "aws_dynamodb_table" "voarPerguntas" {
  name         = "voarPerguntas"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "_id"
  range_key    = "table"

  attribute {
    name = "_id"
    type = "S"
  }

  attribute {
    name = "table"
    type = "S"
  }
}

resource "aws_dynamodb_table" "voarRespostas" {
  name         = "voarRespostas"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "_id"
  range_key    = "table"

  attribute {
    name = "_id"
    type = "S"
  }

  attribute {
    name = "table"
    type = "S"
  }
}





#voarPerguntas

#voarRespostas




















# resource "aws_dynamodb_table" "this" {
#   hash_key       = "TodoId"
#   name           = var.service_name
#   read_capacity  = 5
#   write_capacity = 5

#   attribute {
#     name = "TodoId"
#     type = "S"
#   }

# #  tags = local.common_tags
# }

# resource "aws_dynamodb_table_item" "todo" {
#   table_name = aws_dynamodb_table.this.name
#   hash_key   = aws_dynamodb_table.this.hash_key

#   item = <<ITEM
# {
#   "TodoId": {"S": "1"},
#   "Task": {"S": "Aprender Terraform"},
#   "Done": {"S": "0"}
# }
# ITEM

# }
