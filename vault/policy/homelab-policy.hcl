# homelab-policy.hcl
path "kv/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/metadata/*" {
  capabilities = ["list", "delete"]
}