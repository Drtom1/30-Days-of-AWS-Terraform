resource "aws_s3_bucket" "bucket01" {
    count = length(var.bucket_names)
    bucket = var.bucket_names[count.index]
    tags = var.tags
    }
    
    resource "aws_s3_bucket" "bucket02" {
        for_each = var.bucket_names_set
        bucket = each.key
        tags = var.tags

        depends_on = [ aws_s3_bucket.bucket01 ]
    }

