# Zentao

---
## 升级
1. 先确保`www/zentaopms/www/ok.txt`不存在
2. 关闭`docker-compose stop`
3. 备份`www`
4. 将下载的zip解压后覆盖到`www`中
5. 启动`docker-compose up -d`
6. 进入禅道按照提示添加`www/zentaopms/www/ok.txt`后续按照提示升级即可。如果提示需要管理员账号登录，就切换到管理员账号。
7. 升级成功后删除`www/zentaopms/www/ok.txt`