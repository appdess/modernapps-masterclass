output "db_endpoint" {
    value = aws_db_instance.masterclass-db.endpoint 
    description = "Database Endpoint"
}

output "db_name" {
    value = aws_db_instance.masterclass-db.name 
    description = "Name of database"
}
