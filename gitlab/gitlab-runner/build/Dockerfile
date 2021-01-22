FROM centos:7

ENV TZ Asia/Shanghai

RUN && curl https://setup.ius.io | sh && yum install -y git224 \
    && yum update -y \
    && curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | bash \
    && yum list gitlab-runner --showduplicates | sort -r \
    && yum install -y subversion make autoconf gcc readline-devel glibc

RUN export GITLAB_RUNNER_DISABLE_SKEL=true; yum install -y gitlab-runner-13.6.0-1
