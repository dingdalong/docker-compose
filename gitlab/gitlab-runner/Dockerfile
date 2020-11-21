FROM gitlab/gitlab-runner:alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update && apk add --no-cache docker

ENV TZ Asia/Shanghai
