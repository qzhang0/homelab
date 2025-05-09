Get into vault docker container

```
docker exec -it <mycontainer> sh
```

When inside the vault docker container, remember to set enviroment variable

```
export VAULT_ADDR="http://127.0.0.1:8200"
```

## Setup AppRole on Vault Server

### Create a policy

Write a policy file like cloudflared-policy.hcl
```
# cloudflared-policy.hcl
path "kv/data/homelab/cloudflared/*" {
  capabilities = ["read"]
}
```

Apply it

```
vault policy write cloudflared-policy cloudflared-policy.hcl
```

Enable AppRole

```
vault auth enable approle
```

Create a Role

```
vault write auth/approle/role/cloudflared-role \
    token_policies="cloudflared-policy" \
    token_ttl=1h \
    token_max_ttl=4h
```

Get Role ID and Secret ID

```
vault read auth/approle/role/cloudflared-role/role-id
```

Generate Secret ID:
```
vault write -f auth/approle/role/cloudflared-role/secret-id
```

Save both values carefully.