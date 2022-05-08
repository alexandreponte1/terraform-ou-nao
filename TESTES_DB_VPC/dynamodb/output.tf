output "dynamoPergunta_arn" {
  value = aws_dynamodb_table.voarPerguntas.arn
}

output "dynamoResposta_arn" {
  value = aws_dynamodb_table.voarRespostas.arn
}