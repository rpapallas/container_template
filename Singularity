bootstrap:docker
From:ubuntu:20.04

%labels

AUTHOR Rafael Papallas (rpapallas.com)

%environment
    export LANG=C.UTF-8
    export LC_ALL=C.UTF-8
%files
  scripts /scripts

%post
  /scripts/post_script.sh

%runscript
  exec /bin/bash "$@" --rcfile /scripts/run_script.sh
