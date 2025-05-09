# MinIO

## systemd Mount for MinIO NAS - failed due to access permission from MinIO inside Docker container

Create file:
`/etc/systemd/system/mnt-minio\x2dnas.mount`

```
[Unit]
Description=MinIO NFS Mount
After=network-online.target
Wants=network-online.target

[Mount]
What=10.0.0.20:/mnt/TrueNAS-Pool/minio-nas
Where=/mnt/minio-nas
Type=nfs
Options=defaults,_netdev,nolock

[Install]
WantedBy=multi-user.target
```

Note: The name `mnt-minio\x2dnas.mount` matches the mount path `/mnt/minio-nas` using systemd-escape.

Enable and start

```shell
sudo systemctl daemon-reexec
sudo systemctl enable mnt-minio\\x2dnas.mount
sudo systemctl start mnt-minio\\x2dnas.mount
```