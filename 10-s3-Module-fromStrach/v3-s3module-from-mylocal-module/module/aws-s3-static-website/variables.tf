variable "bucket_name" {
  description = "Bucket name"
  type        = string

}

variable "bucket-tags" {
  description = "Bucket tags"
  type        = map(string)
  default = {}
}