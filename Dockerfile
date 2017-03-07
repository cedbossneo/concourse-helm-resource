FROM google/cloud-sdk:latest

RUN apt-get update && apt-get install -y git jq curl

ADD https://storage.googleapis.com/kubernetes-release/release/v1.5.2/bin/linux/amd64/kubectl /usr/bin/kubectl
ADD https://kubernetes-helm.storage.googleapis.com/helm-v2.2.0-linux-amd64.tar.gz /tmp/helm-v2.2.0-linux-amd64.tar.gz

RUN tar -xvf /tmp/helm-v2.2.0-linux-amd64.tar.gz && mv linux-amd64/helm /usr/bin/helm

RUN chmod +x /usr/bin/kubectl /usr/bin/helm

WORKDIR /tmp/build

ADD helm.sh /helm.sh

RUN helm init -c

ADD bin /opt/resource

CMD /helm.sh
