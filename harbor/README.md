# Harbor
镜像仓库

到`https://github.com/goharbor/harbor/releases`下载`harbor-offline-installer-vx.x.x.tgz`或`harbor-online-installer-vx.x.x.tgz`  
拷贝`harbor.yml.tmpl`为`harbor.yml`  
修改`harbor.yml`中的
```
hostname
certificate
private_key
harbor_admin_password
password
data_volume
```

运行`install.sh（可能需要用到sudo权限）`
