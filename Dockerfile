FROM node:12.20.0-alpine3.12

RUN apk add --no-cache --update grep make git curl jq wget util-linux zip bash busybox busybox-extras util-linux openssl openssh socat groff less g++ libffi-dev openssl-dev libxml2-dev libxslt-dev ca-certificates cargo && \

    # Python
    apk add --no-cache --update py-pip python3 python3-dev  && \
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
    curl -L https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip -o terraform12.zip && \
    unzip terraform12.zip -d /tmp && \
    mv /tmp/terraform /usr/local/bin/terraform12 && \
    rm -rf terraform12.zip && \

    # Terraform 13
    curl -L https://releases.hashicorp.com/terraform/0.13.6/terraform_0.13.6_linux_amd64.zip -o terraform13.zip && \
    unzip terraform13.zip -d /tmp && \
    mv /tmp/terraform /usr/local/bin/terraform13 && \
    rm -rf terraform13.zip && \

    # Terraform 14
    curl -L https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip -o terraform14.zip && \
    unzip terraform14.zip -d /tmp && \
    mv /tmp/terraform /usr/local/bin/terraform14 && \
    rm -rf terraform14.zip && \

    # TFLint 0.19 (compatible with both Terraform 0.12 & 0.13)
    curl -L https://github.com/terraform-linters/tflint/releases/download/v0.19.0/tflint_linux_amd64.zip -o tflint19.zip && \
    unzip tflint19.zip -d /tmp && \
    mv /tmp/tflint /usr/local/bin/tflint19 && \
    rm -rf tflint19.zip && \

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
