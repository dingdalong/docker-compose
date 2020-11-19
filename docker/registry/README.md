## Docker Registry

相比`harbor`的优点在于，`docker pull`的时候，可以和使用`dockerhub`一样  
* `config.yml`中的`remoteurl`可以使用加速源替换
#### 配置客户端
* 创建`cat > ./daemon.json`并写入
```    
{
    "registry-mirrors": ["https://domain"],
    "insecure-registries": [domain]
}
```
