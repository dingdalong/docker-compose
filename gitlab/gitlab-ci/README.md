# GitLab CI/CD

## SSH免密码登录
1. 在客户机使用`ssh-keygen -t rsa`生成密钥对。注意不要设置私钥密码
2. 将`.ssh/id_rsa.pub`导入到要登录的服务器的`.ssh/authorized_keys`中
3. 参考`https://docs.gitlab.com/ee/ci/ssh_keys/`配置gitlab-ci.yml文件

参考：
http://www.linuxproblem.org/art_9.html
https://docs.gitlab.com/ee/ci/ssh_keys/