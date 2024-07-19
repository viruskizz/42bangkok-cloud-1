# 42Bangkok - Inception

The `docker` container project. There are multiple containers in single project. Run all services in application with `docker-compose`.

## Resources
 - https://github.com/mjstealey/wordpress-nginx-docker

## command

```sh
make up
```


## Database Part

Check config
```sh
cat /etc/mysql/mariadb.conf.d/50-server.cnf | grep bind-address
```

check network
```sh
telnet 127.0.0.1 3360
```

access db from remote
```sh
mysql -h 127.0.0.1 -P 3306 -u root -p
```
