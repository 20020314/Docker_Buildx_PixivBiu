#!/bin/bash
# 每次启动获取最新的版本
cd /Pixiv
LATEST_VERSION=$(curl -sX GET "https://api.github.com/repos/zzcabc/Docker_Buildx_PixivBiu/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]')

# 判断旧的版本时候存在
if [ -f "/Pixiv/old" ];then
    # 存在说明重启过容器
    # 将重启时的版本写入新的文件
    echo ${LATEST_VERSION} > new
else
    # 不存在说明是第一次启动容器
    echo "You are running docker for the first time"
    echo "Downloading files now"
    # 将当前版本写入old文件
    echo ${LATEST_VERSION} > old
    # 下载版本
    wget https://github.do/https://github.com/zzcabc/Docker_Buildx_PixivBiu/releases/download/$(cat old)/amd64_$(cat old).tar
    # 解压最新版本
    tar -zxvf *.tar

    # 删除下载的压缩文件
    echo "Download completed"
fi

# 判断新的版本时候存在
if [ -f "/Pixiv/new" ];then
    # 如果存在
    # 判断版本是否不一样
    if [$(cat old) != $(cat new)];then
        echo "Inconsistent versions"
        echo "Version being updated"
        # 不一样，获取最新的版本
        # 下载新的版本
        wget https://github.do/https://github.com/zzcabc/Docker_Buildx_PixivBiu/releases/download/$(cat old)/amd64_$(cat old).tar
        # 解压最新版本
        tar -zxvf *.tar

        # 并将new改名为old
        mv new old

        echo "Update completed"
    fi
fi

# 运行弹幕姬
/Pixiv/main