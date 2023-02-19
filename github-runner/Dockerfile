FROM ubuntu:23.04
ENV DEBIAN_FRONTEND=noninteractive

ARG VERSION=2.306.0
ARG USER="runner"

RUN apt-get update -y && apt-get upgrade -y && \
  apt-get install -y --no-install-recommends curl tar ca-certificates && \
  groupadd --gid 1001 ${USER} && useradd --uid 1001 --gid 1001 -m ${USER}

WORKDIR /home/${USER}
RUN curl -O -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-x64-${VERSION}.tar.gz && \
  tar xf ./*.tar.gz && rm ./*.tar.gz && ./bin/installdependencies.sh && chown -R ${USER} /home/${USER}

ENV REPO=""
ENV TOKEN=""

COPY ./start.sh ./start.sh
USER ${USER} 
ENTRYPOINT ["./start.sh"]
