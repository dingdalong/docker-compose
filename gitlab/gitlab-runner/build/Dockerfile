FROM gitlab/gitlab-runner:alpine-v13.6.0

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update && apk add --no-cache docker subversion

ENV TZ Asia/Shanghai
