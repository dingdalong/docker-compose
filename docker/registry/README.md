## Docker Registry

相比`harbor`的优点在于，`docker pull`的时候，可以和使用`dockerhub`一样  

需要提供并修改`docker-compose.yml`中的证书  
`config.yml`中，`http`下相关数据需要根据实际情况修改

* `config.yml`中的`remoteurl`可以使用加速源替换
#### 配置客户端
* 创建`cat > ./daemon.json`并写入
```    
{
    "registry-mirrors": ["https://domain"],
    "insecure-registries": [domain]
}
```

## Nexus3
各类仓库的管理，包括docker、yum、apt等。有空可以研究一下
管理员账号：admin
查看管理员密码：cat /srv/docker/nexus/nexus-data/admin.password

## Portainer
一个registry的webui