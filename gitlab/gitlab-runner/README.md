# GitLab-Runner

封装了`gitlab/gitlab-runner:alpine`，新的镜像安装好了`docker`，使用`shell`进行操作  

* 执行`launch.sh`，会启动4个`gitlab-runner`，名字分别为`runner,runner2...`  
* 执行`register.sh <url> <token> <runner-name>`注册`runner`到`gitlab`  

---
* 需要设置`/var/run/docker.sock`访问权限
* `.sh`需要执行权限`chmod +x *.sh`
* 可能需要修改镜像和容器的默认存放位置
