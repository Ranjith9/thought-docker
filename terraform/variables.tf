# list of variables used in this terraform code

variable "doc_registery_user" {
  type        = "string"
  description = "the username to authenticate docker registry."
}

variable "doc_registery_password" {
  type        = "string"
  description = "the password to authenticate docker registry."
}

variable "doc_registry" {
  type        = "string"
  description = "the domain of the docker registry to which terraform should connect."
}

variable "doc_conf_file" {
  type        = "string"
  description = "path to the docker config file."
}

variable "doc_tomcat_image" {
  type        = "string"
  description = "the name and of the tomcat docker image with tags."
}

variable "doc_company_web_image" {
  type        = "string"
  description = "the name of the docker image which hosts static files."
}

variable "doc_company_image" {
  type        = "string"
  description = "the name of the docker image which hosts static files."
}
