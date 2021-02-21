## NEXUS3安装

* 注意根据需要开放`nexus3`的匿名访问
## YUM源

### nexus3配置
创建`repository`，类型为`yum(proxy)`，其中`remote storage`填写`http://mirrors.163.com/centos/`即可
### centos端配置
1. 备份  
    ```
    mkdir /etc/yum.repos.d/backup
    mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup
    ```
2. 添加源  
    修改`nexus.repo`中的地址
    `nexus.repo`放到`/etc/yum.repos.d`
3. 构建yum缓存  
    ```
    yum clean all
    yum update
    ```
