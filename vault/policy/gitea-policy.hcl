# gitea-policy.hcl
path "kv/data/homelab/gitea" {
  capabilities = ["read"]
}

path "kv/data/homelab/gitea/*" {
  capabilities = ["read"]
}