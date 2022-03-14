# [Docker_Buildx_PixivBiu](https://hub.docker.com/r/zzcabc/pixivbiu) <-点击跳转DockerHub

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/txperl/PixivBiu?label=danmuji&style=flat-square)](https://github.com/txperl/PixivBiu/releases/latest) [![Docker Image Version (latest by date)](https://img.shields.io/docker/v/zzcabc/pixivbiu?label=DockerHub&style=flat-square)](https://hub.docker.com/r/zzcabc/pixivbiu/tags?page=1&ordering=last_updated)

本项目使用Docker Buildx构建全平台镜像，支持~linux/386~、linux/amd64、~linux/armv6~、inux/armv7、linux/armv8、~linux/ppc64le、linux/s390x~框架；

使用pyinstaller和源码编译两种方式进行打包，pyinstaller构建采用alpine:latest作为底包，镜像体积缩减至40M；

源码编译采用python:3.7.12-alpine3.14作为底包，镜像体积为180M+

使用GitHub Action在中国时间 **0:00** 自动拉取[txperl/PixivBiu](https://github.com/txperl/PixivBiu)的源码进行构建Docker镜像，**但当源码版本和Docker镜像版本一致将不会构建镜像**，构建时间大约需要**30分钟**

# 使用方式

在启动镜像之前，你需要准备[config.yml](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/config.yml)配置文件以及[.token.json](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/.token.json)的用户登录token

**需要注意sys.host虽然可以传入，但是不建议更改，如果更改无法使用概不负责**

   `-e sys.host="0.0.0.0:4001"`

**如果你不使用aria，'{ROOTPATH}/downloads'路径不能修改**

   `-e biu.download.saveURI="{ROOTPATH}/downloads/{KT}/"`

将本项目的[config.yml](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/config.yml)直接可用

~~[点击查看token的获取方式](https://github.com/zzcabc/Docker_Buildx_PixivBiu/blob/master/getToken.md)~~

**请使用客户端获取.token.json文件**


## pyinstaller构建镜像的使用方式（默认拉取）

### 国内镜像地址：将 `zzcabc/pixivbiu:latest` 换成 `registry.cn-hangzhou.aliyuncs.com/zzcabc/pixivbiu:latest`

```sh
docker run -d \
    --name pixivbiu \
    --user $(id -u):$(id -g) \
    -p 本机端口:4001 \
    -v 本机路径:/Pixiv/config.yml \
    -v 本机路径:/Pixiv/downloads \
    -v 本机路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu
```

### 环境变量具体参照[源码的配置](https://github.com/txperl/PixivBiu/blob/master/app/config/biu_default.yml)使用了环境变量创建容器，可用不需要传入config.yml

#### 如果你使用环境变量传配置，请自行修改下方 ` -e ` 中的内容
```sh
docker run -d \
    --name pixivbiu \
    --user $(id -u):$(id -g) \
    -p 本机端口:4001 \
    -e sys.debug=false \
    -e sys.apiRoute="direct" \
    -e sys.proxy= \
    -e sys.language= \
    -e sys.theme=multiverse \
    -e sys.autoOpen=true \
    -e biu.search.maxThreads=8 \
    -e biu.search.loadCacheFirst=true \
    -e biu.download.mode=dl-single \
    -e biu.download.aria2Host="localhost:6800" \
    -e biu.download.aria2Secret="" \
    -e biu.download.maxDownloading=8 \
    -e biu.download.saveURI="{ROOTPATH}/downloads/{KT}/" \
    -e biu.download.saveFileName="{title}_{work_id}" \
    -e biu.download.autoArchive=true \
    -e biu.download.autoDeterTheSame=true \
    -e biu.download.whatsUgoira=webp \
    -e biu.download.imageHost="" \
    -v 本机路径:/Pixiv/downloads \
    -v 本机路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu
```

### 同样你也可以使用默认的配置形式启动容器

```sh
docker run -d \
    --name pixivbiu \
    --user $(id -u):$(id -g) \
    -p 本机端口:4001 \
    -v 本机路径:/Pixiv/downloads \
    -v 本机路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu
```

## 源码编译构建镜像的使用方式

### 国内镜像地址：将 `zzcabc/pixivbiu:latest-src` 换成 `registry.cn-hangzhou.aliyuncs.com/zzcabc/pixivbiu:latest-src`

```sh
docker run -d \
    --name pixivbiu \
    --user $(id -u):$(id -g) \
    -p 本机端口:4001 \
    -v 本机路径:/Pixiv/config.yml \
    -v 本机路径:/Pixiv/downloads \
    -v 本机路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu:latest-src
```

### 环境变量具体参照[源码的配置](https://github.com/txperl/PixivBiu/blob/master/app/config/biu_default.yml)使用了环境变量创建容器，可用不需要传入config.yml

#### 如果你使用环境变量传配置，请自行修改下方 ` -e ` 中的内容
```sh
docker run -d \
    --name pixivbiu \
    --user $(id -u):$(id -g) \
    -p 本机端口:4001 \
    -e sys.debug=false \
    -e sys.apiRoute="direct" \
    -e sys.proxy= \
    -e sys.language=zh \
    -e sys.theme=multiverse \
    -e sys.autoOpen=true \
    -e biu.search.maxThreads=8 \
    -e biu.search.loadCacheFirst=true \
    -e biu.download.mode=dl-single \
    -e biu.download.aria2Host="localhost:6800" \
    -e biu.download.aria2Secret="" \
    -e biu.download.maxDownloading=8 \
    -e biu.download.saveURI="{ROOTPATH}/downloads/{KT}/" \
    -e biu.download.saveFileName="{title}_{work_id}" \
    -e biu.download.autoArchive=true \
    -e biu.download.autoDeterTheSame=true \
    -e biu.download.whatsUgoira=webp \
    -e biu.download.imageHost="" \
    -v 本机路径:/Pixiv/downloads \
    -v 本机路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu:latest-src
```

### 同样你也可以使用默认的配置形式启动容器

```sh
docker run -d \
    --name pixivbiu \
    --user $(id -u):$(id -g) \
    -p 本机端口:4001 \
    -v 本机路径:/Pixiv/downloads \
    -v 本机路径:/Pixiv/usr/.token.json \
    zzcabc/pixivbiu:latest-src
```

# 映射路径说明

此说明对应Docker容器内

`/Pixiv/downloads`                  图片下载地址

`/Pixiv/config.yml`                 配置文件(有环境变量即可不用传入)

`/Pixiv/usr/.token.json`            Token 存放位置(必须映射)

# Aria的使用方法

## Aria镜像

### 推荐使用p3terx的Aria2Pro

### SECRET不配置默认为p3terx

```sh
docker run -d \
    --name aria2-pro \
    --restart unless-stopped \
    --log-opt max-size=1m \
    -e PUID=$UID \
    -e PGID=$GID \
    -e UMASK_SET=022 \
    -e RPC_SECRET=<TOKEN> \
    -e RPC_PORT=6800 \
    -e LISTEN_PORT=6888 \
    -p 6800:6800 \
    -p 6888:6888 \
    -p 6888:6888/udp \
    -v 本地路径/aria2-config:/config \
    -v 本地路径/aria2-downloads:/downloads \
    p3terx/aria2-pro
```

## 使用Aria需要更改的地方

`biu.download.mode`         为  `aria2`

`biu.download.aria2Host`    为  `aria的ip:6800`

`biu.download.aria2Secret`  为  `aria的secret`

`biu.download.saveURI`      为  `/downloads`

# ~[测试地址](https://hub.docker.com/r/zzcabc/pixivbiu-test)~

# TODO

- [x] 精简镜像大小

- [ ] 内置Aria2

- [x] 上传阿里镜像仓库
