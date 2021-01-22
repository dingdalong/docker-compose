FROM centos:7

ENV TZ Asia/Shanghai

RUN yum update -y \
    && curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | bash \
    && export GITLAB_RUNNER_DISABLE_SKEL=true; yum install -y gitlab-runner \
    && yum list gitlab-runner --showduplicates | sort -r \
    && export GITLAB_RUNNER_DISABLE_SKEL=true; yum install -y gitlab-runner-13.6.0-1 \
    && yum install -y subversion
