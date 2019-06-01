# this provider helps in conneting to docker

provider "docker" {
  host = "tcp://127.0.0.1:2375"

  registry_auth {
    address     = "${var.doc_registry}"
    config_file = "${var.doc_conf_file}"

    # credentials to connect the docker hub
    # this will be fed from environment variable as terraform variable (ex: TF_VAR_doc_registery_user, TF_VAR_doc_registery_password)
    username = "${var.doc_registery_user}"

    password = "${var.doc_registery_password}"
  }
}
