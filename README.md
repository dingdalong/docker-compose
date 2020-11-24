# Docker-compose

利用docker-compose快速搭建的开发系统  
到对应的目录使用docker-compose up -d启动

* [Docker](./docker/README.md)：一切的基础
* [GitLab](./gitlab//README.md)：程序用到的git仓库
* [k8s](./k8s/README.md)：使用kind快速创建
* [Harbor](./harbor/README.md)：镜像仓库
* [Zentao](./zentao/README.md)：协作平台
* [FTP](./ftp/README.md)：网盘
* [SVN](./scmmanager/README.md)：策划和美术使用
* [SSL](./ssl/README.md)：自签证书
* [Registry](./docker/registry/README.md)：镜像仓库

## 注意事项
### 时间同步
注意服务器时间，在安装前最好同步一下时间
1. 查看当前机器时间`date`，查看BIOS时间`hwclock  -r`
2. 安装ntpdate`yum install ntpdate -y`
3. 同步时间`ntpdate ntp1.aliyun.com`
4. 同步到BIOS`clock -w`
5. 定时同步`0 6 * * *    ntpdate ntp1.aliyun.com`

设置时区`ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone`

### [中文字符集支持](./docker/README.md)
