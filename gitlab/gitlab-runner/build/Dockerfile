FROM centos:7

ENV TZ Asia/Shanghai

RUN yum update -y \
    && curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | bash \
    && yum list gitlab-runner --showduplicates | sort -r \
    && yum install -y subversion git make autoconf gcc readline-devel glibc

RUN export GITLAB_RUNNER_DISABLE_SKEL=true; yum install -y gitlab-runner-13.6.0-1
