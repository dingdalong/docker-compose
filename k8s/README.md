# Kubernetes
## 安装

1. 下载kind
    ```
    wget https://github.com/kubernetes-sigs/kind/releases/download/v0.9.0/kind-linux-amd64
    mv kind-linux-amd64 kind
    chmod +x kind
    mv kind /usr/local/bin
    ```

2. 运行`kind create cluster --config=kind-config.yaml`
    * 注意GitLab支持的Kubernetes版本

## 集成到Gitlab
1. 下载kubectl
    ```
    wget https://dl.k8s.io/v1.19.1/kubernetes-client-linux-amd64.tar.gz
    tar -zxvf kubernetes-client-linux-amd64.tar.gz
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin
    ```
2. 获取api地址：`kubectl cluster-info | grep 'Kubernetes master' | awk '/http/ {print $NF}'`

3. 获取名称：`kubectl get secrets`

4. 获取ca文件：`kubectl get secret <第3步获取到的名称> -o jsonpath="{['data']['ca\.crt']}" | base64 --decode`

5. 获取token：
    1. 绑定账号和角色信息到集群：`kubectl apply -f gitlab-admin-service-account.yaml`

        * 没有权限的话，使用管理员账号处理：`kubectl apply -f gitlab-admin-service-account.yaml --username=admin --password=<password>`
    2. 获取token：`kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep gitlab | awk '{print $1}')`

---
### kubectl操作
* 获取所有的命名空间：`kubectl get namespace`
* 获取指定命名空间中所有的pod：`kubectl get pods -n <namespace>`
* 获取pod中的日志：`kubectl logs <podname> -n <namespace>`
* 获取pod描述：`kubectl describe pod <podname> -n <namespace>`
