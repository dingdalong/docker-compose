## Docker

* 安装  
`sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun`
* 启动、开机启动、添加到用户组  
`sudo systemctl start docker && sudo systemctl enable docker && sudo usermod -aG docker develop && newgrp docker`
* 加速源
    * 创建`cat >daemon.json`并写入
        ```    
        {
                "registry-mirrors": [], # 根据需要填写加速镜像地址
                "insecure-registries": [] # 根据需要填写不校验地址
        }
        ```
    * 拷贝、重载并重启  
    `sudo mv ./daemon.json /etc/docker/daemon.json && sudo systemctl daemon-reload && sudo systemctl restart docker`

---

## Docker-Compose
* 安装  
``
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
``

  这个下载可能比较慢，可以下好一个之后上传，linux之间可以用scp传输
* 添加执行权限  
``
sudo chmod +x /usr/local/bin/docker-compose
``

## 中文字符集
以`Centos`为例
* 已有镜像  
  添加`docker-compose`环境变量：  
  ```Dockerfile
  environment: 
      - LANG=zh_CN.UTF-8
  ```

  执行`locale`查当前环境使用的语言
  执行`locale -a`查看当前系统支持的语言包

  1. 安装语言包`yum install kde-l10n-Chinese -y`
  2. 更新gitbc包`yum install glibc-common -y`
  3. 设置系统语言包`localedef -c -f UTF-8 -i zh_CN zh_CN.utf8`
  4. 编辑`vi /etc/profile`新增`export LC_ALL=zh_CN.UTF-8`
  5. 生效`source /etc/profile`
  6. 编辑`vi /etc/locale.conf`新增`LANG="zh_CN.UTF-8"`
  7. 重启`docker-compose restart`

* Dockerfile:
  ```Dockerfile
  RUN yum install kde-l10n-Chinese -y
  RUN yum install glibc-common -y
  RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
  RUN export LANG=zh_CN.UTF-8
  RUN echo "export LANG=zh_CN.UTF-8" >> /etc/locale.conf
  ENV LANG zh_CN.UTF-8
  ENV LC_ALL zh_CN.UTF-8
  ```

参考：  
https://blog.csdn.net/wo541075754/article/details/89787894