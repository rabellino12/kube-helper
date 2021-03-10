FROM amazon/aws-cli:2.1.28

ARG GCLOUD_VERSION=329.0.0

RUN yum install -y curl unzip tar gzip xz-utils ca-certificates

RUN curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz" -s -o "sdk.tar.gz"
RUN ls
RUN tar xzf ./sdk.tar.gz
RUN ls
RUN ./google-cloud-sdk/install.sh -q

ENV PATH="/aws/google-cloud-sdk/bin:${PATH}"

ENTRYPOINT [ "/bin/bash" ]