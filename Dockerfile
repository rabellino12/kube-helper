FROM amazon/aws-cli:2.1.28

ARG GCLOUD_VERSION=329.0.0
ARG KUBECTL_VERSION=v1.20.0

RUN yum install -y curl unzip tar gzip xz-utils ca-certificates openssl

RUN curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz" -s -o "sdk.tar.gz"
RUN ls
RUN tar xzf ./sdk.tar.gz
RUN ls
RUN ./google-cloud-sdk/install.sh -q

ENV PATH="/aws/google-cloud-sdk/bin:${PATH}"

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

ENTRYPOINT [ "/bin/bash" ]