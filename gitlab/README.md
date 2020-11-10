# Gitlab
* 管理员账号`root`
* 注意主机端口限制问题
* 启用ip转发`net.ipv4.ip_forward=1`，重启网络`sudo systemctl restart network`
* 定期备份输入`crontab -e`后，输入` 0 8 * * * docker exec -t gitlab gitlab-backup create`保存退出
### 获取license
目前最新13.5.3可使用
1. 修改`ruby/license.rb`中的`license.starts_at`和`license.expires_at`为期望的开始、结束时间

2. 进入ruby，安装并生成license
    ```
    gem install gitlab-license
    ruby license.rb
    ```
3. 进入gitlab，替换license_encryption_key.pub  
`cp ./license_data/license_key.pub /opt/gitlab/embedded/service/gitlab-rails/.license_encryption_key.pub`

4. 更改计划类型  
    ```
    vi /opt/gitlab/embedded/service/gitlab-rails/ee/app/models/license.rb

    将
    restricted_attr(:plan).presence || STARTER_PLAN
    改为
    restricted_attr(:plan).presence || ULTIMATE_PLAN
    ```

5. 使用`gitlab-ctl reconfigure && gitlab-ctl restart`重载配置并重启gitlab
6. 登录gitlab，到设置中导入`GitLabBV.gitlab-license`

* 注意  
docker重启后，需要从第3步开始重新设置license。

### 更新
1. 备份
    `docker exec -t <container name> gitlab-backup create`
2. 下载、更新
    ```
    docker-compose pull
    docker-compose up -d
    ```
### 恢复
1. `gitlab-ctl stop unicorn`
2. `gitlab-ctl stop sidekiq`
3. `chmod 777 *_gitlab_backup.tar`
4. `gitlab-rake gitlab:backup:restore BACKUP=*`
---
## 内置系统的启用
启用以下系统，使用域名而不是ip是最简单的方式  
域名解析设置对了，开放80、443端口即可，不需要额外启用端口`Registry可能需要用到5050，待证实`  
首先是GitLab的域名  
`external_url 'http://gitlab.example.io'`  
添加A记录，将`gitlab.example.io`解析到服务器的ip

### Gitlab Pages
`pages_external_url 'http://pages.example.io'`  
添加A记录，将`*.pages.example.io`解析到服务器的ip  
**这里解析特殊一点，注意pages前面的`*.`**

容器启动的时候，需要额外的权限，添加`gitlab_pages['inplace_chroot'] = true`
### Mattermost
`mattermost_external_url 'http://mattermost.example.io'`  
添加A记录，将`mattermost.example.io`解析到服务器的ip

### Container Registry
`registry_external_url 'http://registry.gitlab.example.io'`  
添加A记录，将`registry.gitlab.example.io`解析到服务器的ip  
这边没有用到https，所以docker这边连接镜像库的时候，需要在docker的配置文件`daemon.json`中添加`"insecure-registries": ["http://registry.gitlab.example.io"]`，添加完毕后需要重启docker

### LDAP
待验证