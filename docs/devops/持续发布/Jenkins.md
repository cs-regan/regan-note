### Mac 环境使用Docker安装Jenkins

#### 1. 新建本地挂载文件

```shell
docker run -itd -p 9250:8080 -p 15000:50000 --name jenkins --privileged=true  -v /Users/ligen/docker/k8s_jenkins:/var/jenkins_home jenkins/jenkins:lts
```

从 jenkins/jenkins:lts 下载稳定版本镜像



#### 2. 查看容器运行状态

docker ps 

```
CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                                              NAMES
7142891ac6b3        jenkins/jenkins:lts   "/sbin/tini -- /usr/…"   11 minutes ago      Up 11 minutes       0.0.0.0:9250->8080/tcp, 0.0.0.0:15000->50000/tcp   jenkins
```



#### 3. 访问Jenkins

```
localhost:9250
```

这里需要输入Jenkins随机生成的密码，根据提示可以到 jenkins_home/secrets/initialAdminPassword 获取默认密码

输入默认密码后，进入配置界面

#### 4. 安装插件

选择推荐插件，右边可以自定义安装

![img](https://upload-images.jianshu.io/upload_images/3245733-9947b1b88d70cba0.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)



#### 5. 输入账号密码，点击完成安装

![img](https://upload-images.jianshu.io/upload_images/3245733-1540c01998c0792d.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)





#### 6. 进入jenkins面板首页

<img src="http://qiniu.likephp.cn/image/nOivOcR4oyIL13KEmQL5N03TtuPBRT5CbsLTk0bH.png">



<hr/>



[Tag]: <tag>Jenkins,devops</tag>