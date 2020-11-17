# FTP

## 外传内
基于rsync`(用于文件传输)`和inotify`(用于文件变动检测)`

#### 内外网都需要安装rsync
1. 安装rsync`yum -y install rsync`
2. 启动rsync服务`ystemctl start rsyncd.service`
3. 开机启动`systemctl enable rsyncd.service`
4. 检查是否已经成功启动`netstat -lnp|grep 873`

#### 内网服务器：
1. 复制配置文件`cp ./rsync/rsyncd.conf /etc/rsyncd.conf`
2. 复制密钥文件`cp ./rsync/rsync.password /etc/rsync.password`
3. 获取密钥权限`chmod 600 /etc/rsync.password`

#### 外网服务器：
1. 下载inotify-tools`https://github.com/inotify-tools/inotify-tools.git`
2. 安装依赖工具`yum  -y install autoconf automake libtool`
3. 安装inotify`cd inotify-tools && autogen.sh && .configure && make && make install`
4. 运行`inotify-tools/inotify_bak.sh`
