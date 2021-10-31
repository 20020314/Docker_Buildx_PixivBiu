FROM alpine:latest
RUN apk add -U --no-cache python3 python3-dev py3-pip tzdata git gcc libc-dev musl-dev linux-headers jpeg-dev zlib-dev && \
    git clone --depth=1 https://github.com/txperl/PixivBiu.git && \
    mkdir Pixiv && \
    mkdir /PixivBiu/.pkg/code && \
    mkdir /PixivBiu/.pkg/public && \
    cp -r /PixivBiu/altfe/ /PixivBiu/.pkg/code/altfe/ && \
    cp -r /PixivBiu/app/ /PixivBiu/.pkg/code/app/ && \
    cp /PixivBiu/main.py /PixivBiu/.pkg/code/ && \
    cp -r /PixivBiu/usr/ /PixivBiu/.pkg/public/usr/ && \
    cp /PixivBiu/config.yml /PixivBiu/.pkg/public/ && \
    cp /PixivBiu/LICENSE /PixivBiu/.pkg/public/ && \
    cp /PixivBiu/README.md /PixivBiu/.pkg/public/ && \
    pip install -r /PixivBiu/requirements.txt && \
    pip install pyinstaller  && \
    python3 /PixivBiu/.pkg/py-pkger.py auto && \
    mv /PixivBiu/.pkg/dist/* /Pixiv  && \
    rm -rf PixivBiu/ && \
    rm /Pixiv/config.yml && \
    rm /Pixiv/LICENSE && \
    rm /Pixiv/README.md && \
    apk del python3 python3-dev py3-pip tzdata git gcc libc-dev musl-dev linux-headers jpeg-dev zlib-dev && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache && \
    rm -rf /tmp/* 
EXPOSE 4001
VOLUME /Pixiv/usr/.token.json /Pixiv/config.yml /Pixiv/downloads
ENTRYPOINT ["/Pixiv/main"]