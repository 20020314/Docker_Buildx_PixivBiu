# [Docker_Buildx_PixivBiu](https://hub.docker.com/r/zzcabc/pixivbiu) <-点击跳转DockerHub


[![GitHub release (latest by date)](https://img.shields.io/github/v/release/txperl/PixivBiu?label=PixivBiu&style=flat-square)](https://github.com/txperl/PixivBiu/releases/latest) [![Docker Image Version (latest by date)](https://img.shields.io/docker/v/zzcabc/pixivbiu?label=DockerHub&style=flat-square)](https://hub.docker.com/r/zzcabc/pixivbiu/tags?page=1&ordering=last_updated)

### 如果你发现上面图标版本不一致，请点击一下star，这样会触发自动构建镜像，即使你之后取消star


本项目使用Docker Buildx构建全平台镜像，支持linux/386、linux/amd64、linux/armv6、inux/armv7、linux/armv8、linux/ppc64le、linux/s390x框架，并使用python:3.7.12-alpine3.14作为底包


使用GitHub Action在中国时间 **0:00** 自动拉取[txperl/PixivBiu](https://github.com/txperl/PixivBiu)的源码进行构建Docker镜像，**但当源码版本和Docker镜像版本一致将不会构建镜像**，由源码构建时间大概45分钟

# 使用方式

在启动镜像之前，你需要准备[config.yml](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/config.yml)配置文件以及[.token.json](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/.token.json)的用户登录token

将本项目的[config.yml](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/config.yml)直接可用

[点击查看token的获取方式](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/getToken.md)



```sh
docker run -d \
    --name pixivbiu \
    -p 本机端口:4001 \
    -v 本机路径:/PixivBiu/config.yml \
    -v 本机路径:/PixivBiu/downloads \
    -v 本级路径:/PixivBiu/usr/.token.json \
    zzcabc/pixivbiu:latest
```
### 在2.1.2a之后(不包括2.1.2a)版本将使用pyinstaller进行打包，并采用alpine:latest作为底包，同样全框架进行构建，镜像体积缩减至40M，构建时间大约需要1小时

在2.1.2a之后版本改为

```sh
docker run -d \
    --name pixivbiu \
    -p 本机端口:4001 \
    -v 本机路径:/Pixiv/config.yml \
    -v 本机路径:/Pixiv/downloads \
    -v 本级路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu:latest
```

/Pixiv/downloads                  图片下载地址

/Pixiv/config.yml                 配置文件(必须映射)

/Pixiv/usr/.token.json            Token 存放位置(必须映射)

# 映射路径说明

此说明对应Docker容器内

/PixivBiu/downloads                  图片下载地址

/PixivBiu/config.yml                 配置文件(必须映射)

/PixivBiu/usr/.token.json            Token 存放位置(必须映射)

# TODO

- [x] 精简镜像大小

- [ ] 内置Aria2