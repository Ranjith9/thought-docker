# This helps in spinning container with companyNwes.war application intit

resource "docker_image" "app" {
  name = "${var.doc_tomcat_image}"
}

resource "docker_network" "test_network" {
  name   = "test-network"
  driver = "overlay"
}

/*resource "docker_container" "web" {
  name  = "company-web"
  image = "${docker_image.tomcat.latest}"

  ports {
    internal = 8080
    external = 8080
  }

  volumes {
    container_path = "/usr/local/tomcat/webapps/companyNews.war"
    host_path      = "/root/thought-docker/companyNews.war"

    #read_only = true
  }
}*/

/*resource "docker_image" "web" {
  name = "${var.doc_company_web_image}"
}

resource "docker_image" "company" {
  name = "${var.doc_company_image}"
}*/

resource "docker_service" "app" {
  name = "app"

  task_spec {
    container_spec {
      image = "${docker_image.app.latest}"

      mounts = [
        {
          target = "/usr/local/tomcat/webapps/companyNews.war"
          source = "/root/ranjith-assignment/companyNews.war"
          type   = "bind"
        },
      ]
    }

    networks = ["${docker_network.test_network.id}"]
  }

  endpoint_spec {
    ports {
      target_port    = "8080"
      published_port = "8080"
      publish_mode   = "host"
    }
  }
}

resource "docker_service" "web" {
  name = "web"

  task_spec {
    container_spec {
      image = "${var.doc_company_web_image}"
    }

    networks = ["${docker_network.test_network.id}"]
  }

  endpoint_spec {
    ports {
      target_port    = "80"
      published_port = "9001"
      publish_mode   = "host"
    }
  }
}

resource "docker_service" "company" {
  name = "company"

  task_spec {
    container_spec {
      image = "${var.doc_company_image}"
    }

    networks = ["${docker_network.test_network.id}"]
  }

  endpoint_spec {
    ports {
      target_port    = "443"
      published_port = "443"
      publish_mode   = "host"
    }
  }

  depends_on = ["docker_service.app", "docker_service.web"]
}
