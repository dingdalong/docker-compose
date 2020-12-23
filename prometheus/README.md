## node_exporter
节点信息导出
* 创建目录
`mkdir -p /opt/exporter`
`cd /opt/exporter`
* 下载安装包
`wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz`
* 解压
`tar -xvzf node_exporter-1.0.1.linux-amd64.tar.gz`
* 修改名称
`mv node_exporter-1.0.1.linux-amd64 node_exporter`
* 修改权限
`chmod 777 node_exporter`
* 启动服务
`nohup /opt/exporter/node_exporter/node_exporter &`
* 访问
`http://127.0.0.1:9100/metrics`