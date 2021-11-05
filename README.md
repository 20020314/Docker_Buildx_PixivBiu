# [Docker_Buildx_PixivBiu](https://hub.docker.com/r/zzcabc/pixivbiu) <-点击跳转DockerHub

本项目使用Docker Buildx构建全平台镜像，支持linux/386、linux/amd64、linux/armv6、inux/armv7、linux/armv8、linux/ppc64le、linux/s390x框架，使用pyinstaller和源码编译两种方式进行打包，pyinstaller构建采用alpine:latest作为底包，镜像体积缩减至40M；源码编译采用python:3.7.12-alpine3.14作为底包，镜像体积为180M+

使用GitHub Action在中国时间 **0:00** 自动拉取[txperl/PixivBiu](https://github.com/txperl/PixivBiu)的源码进行构建Docker镜像，**但当源码版本和Docker镜像版本一致将不会构建镜像**，由构建时间大约需要2小时

# 使用方式

在启动镜像之前，你需要准备[config.yml](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/config.yml)配置文件以及[.token.json](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/.token.json)的用户登录token

将本项目的[config.yml](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/config.yml)直接可用

[点击查看token的获取方式](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/getToken.md)

### pyinstaller使用方式

```sh
docker run -d \
    --name pixivbiu \
    -p 本机端口:4001 \
    -v 本机路径:/Pixiv/config.yml \
    -v 本机路径:/Pixiv/downloads \
    -v 本级路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu:latest
```

### 源码编译使用方式

```sh
docker run -d \
    --name pixivbiu \
    -p 本机端口:4001 \
    -v 本机路径:/Pixiv/config.yml \
    -v 本机路径:/Pixiv/downloads \
    -v 本级路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu:latest-src
```


# 映射路径说明

此说明对应Docker容器内

/Pixiv/downloads                  图片下载地址

/Pixiv/config.yml                 配置文件(必须映射)

/Pixiv/usr/.token.json            Token 存放位置(必须映射)

# TODO

- [x] 精简镜像大小

- [ ] 内置Aria2
