#!/bin/bash

Token_Path=/Pixiv/usr/.token.json
# 写入token
if [ ! -e "$Token_Path" ]; then
    if [ -n "${Token:-}" ]; then
        echo -e "{ \"token\": \" $Token \"" > $Token_Path
    fi
fi

/Pixiv/main