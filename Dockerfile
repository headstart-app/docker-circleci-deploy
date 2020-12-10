FROM node:12.20.0-alpine3.11

RUN apk add --no-cache --update grep make git curl jq wget util-linux zip bash busybox busybox-extras util-linux openssl openssh socat groff less g++ libffi-dev openssl-dev libxml2-dev libxslt-dev ca-certificates && \

    # Python
    apk add --no-cache --update python py-pip python3 python3-dev  && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    pip3 install --no-cache-dir httpie && \
    ln -sf python3 python && \
    ln -sf pip3 pip && \

    # Docker
    apk add --no-cache --update docker && \
    pip3 install --no-cache-dir docker-compose==1.25.0 && \

    # AWS CLI
    pip3 install --no-cache-dir awscli && \
    # Docker client
    pip3 install --no-cache-dir docker-compose==1.25.0 && \

    # Terraform 11
    curl -L https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip -o terraform11.zip && \
    unzip terraform11.zip -d /tmp && \
    mv /tmp/terraform /usr/local/bin/terraform11 && \
    rm -rf terraform11.zip && \

    # TFLint 0.7.6
    curl -L https://github.com/terraform-linters/tflint/releases/download/v0.7.6/tflint_linux_amd64.zip -o tflint7.zip && \
    unzip tflint7.zip -d /tmp && \
    mv /tmp/tflint /usr/local/bin/tflint7 && \
    rm -rf tflint7.zip && \

    # Terraform 12
    curl -L https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip -o terraform12.zip && \
    unzip terraform12.zip -d /tmp && \
    mv /tmp/terraform /usr/local/bin/terraform12 && \
    rm -rf terraform12.zip && \

    # TFLint 0.14
    curl -L https://github.com/terraform-linters/tflint/releases/download/v0.14.0/tflint_linux_amd64.zip -o tflint14.zip && \
    unzip tflint14.zip -d /tmp && \
    mv /tmp/tflint /usr/local/bin/tflint14 && \
    rm -rf tflint14.zip && \

    # JSON
    export npm_config_unsafe_perm=true && \
    npm install -g json && \

    # Transcrypt
    git clone -b 'v2.0.0' https://github.com/elasticdog/transcrypt.git && \
    cd transcrypt/ && \
    bash -c 'ln -s ${PWD}/transcrypt /usr/local/bin/transcrypt' && \
    cd .. && \

    # Cleanup
    rm -rf /root/.cache && \
    rm -rf /var/cache/* 
    
CMD [ "sh" ]
