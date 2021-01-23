FROM centos:7

ENV TZ Asia/Shanghai

RUN curl https://setup.ius.io | sh && yum install -y git224 \
    && yum update -y \
    && curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | bash \
    && yum list gitlab-runner --showduplicates | sort -r \
    && yum install -y subversion make autoconf readline-devel centos-release-scl devtoolset-8 \
    && scl enable devtoolset-8 bash \
    && mv /usr/bin/gcc /usr/bin/gcc-4.8.5 \
    && ln -s /opt/rh/devtoolset-8/root/bin/gcc /usr/bin/gcc

RUN export GITLAB_RUNNER_DISABLE_SKEL=true; yum install -y gitlab-runner-13.6.0-1
