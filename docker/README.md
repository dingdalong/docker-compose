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
