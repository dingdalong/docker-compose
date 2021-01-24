# GitLab-Runner

基于centos构建了带有`gitlab-runner,svn的镜像`，使用`shell`进行操作  

* 执行`launch.sh`，会启动4个`gitlab-runner`，名字分别为`runner,runner2...`  
* 执行`register.sh <url> <token> <runner-name>`注册`runner`到`gitlab`  
* `gcc`使用的`scl`中安装的高版本，需要在ci中使用`source /opt/rh/devtoolset-8/enable`
---
* `.sh`需要执行权限`chmod +x *.sh`
