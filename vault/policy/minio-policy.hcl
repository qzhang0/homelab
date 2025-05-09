# minio-policy.hcl
path "kv/data/homelab/minio" {
  capabilities = ["read"]
}

path "kv/data/homelab/minio/*" {
  capabilities = ["read"]
}