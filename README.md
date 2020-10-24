## Docker

* 安装  
`sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun`
* 启动、开机启动、添加到用户组  
`sudo systemctl start docker && sudo systemctl enable docker && sudo usermod -aG docker develop && newgrp docker`
* 加速源
    * 创建`cat > ./daemon.json`并写入
        ```    
        {
                "registry-mirrors": ["https://xxx.mirror.aliyuncs.com"] //xxx需要替换，查一下自己的阿里云加速地址
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
* 添加执行权限  
``
sudo chmod +x /usr/local/bin/docker-compose
``
## 安装
进入对应的目录，使用`docker-compose up -d`即可启动
* [Gitlab](./gitlab/README.md)
* [SCM-Manager](./scmmanager/README.md)
* [Zentao](./zentao/README.md)
* [Mysql](./mysql)
* [Redis](./redis)

## 时间同步
注意服务器时间，在安装前最好同步一下时间
1. 查看当前机器时间`date`，查看BIOS时间`hwclock  -r`
2. 安装ntpdate`yum install ntpdate -y`
3. 同步时间`ntpdate ntp1.aliyun.com`
4. 同步到BIOS`clock -w`
5. 定时同步`0 6 * * *    ntpdate ntp1.aliyun.com`
