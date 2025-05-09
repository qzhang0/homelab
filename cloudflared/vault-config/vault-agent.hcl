pid_file = "/tmp/vault-agent.pid"

auto_auth {
  method "approle" {
    config = {
      role_id_file_path = "/config/role_id"
      secret_id_file_path = "/config/secret_id"
      remove_secret_id_file_after_reading = false
    }
  }

  sink "file" {
    config = {
      path = "/tmp/vault-agent-token"
    }
  }
}

vault {
  address = "http://<vault-server-vm-ip>:8200"
}

template {
  source      = "/templates/secret-template.ctmpl"
  destination = "/tmp/secret.env"
}