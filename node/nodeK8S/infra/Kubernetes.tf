resource "kubernetes_deployment" "node-API" {
  metadata {
    name = "node-api"
    labels = {
      nome = "node"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        nome = "node"
      }
    }

    template {
      metadata {
        labels = {
          nome = "node"
        }
      }

      spec {
        container {
          image = "alexandreponte/nodeteste:1.1"
          name  = "node"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 3000
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "LoadBalancer" {
  metadata {
    name = "load-balancer-node-api"
  }
  spec {
    selector = {
      nome = "node"
    }
    port {
      port = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}

data "kubernetes_service" "nomeDNS" {
    metadata {
      name = "load-balancer-node-api"
    }
}

output "URL" {
  value = data.kubernetes_service.nomeDNS.status
}