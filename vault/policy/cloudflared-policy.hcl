# cloudflared-policy.hcl
path "kv/data/homelab/cloudflared" {
  capabilities = ["read"]
}