# Gitea

`secret.env` file in `/tmp` is required before docker-compose run.

The first `docker-compose` run will failed since `secret.env` is empty from the view of gitea-db, retry again, it will start successfully.

After gitea is running, create admin user:

```shell
docker exec -u 1000 -it gitea /usr/local/bin/gitea admin user create \
  --username admin \
  --password <password> \
  --email <email> \
  --admin
# New user 'admin' has been successfully created!
```