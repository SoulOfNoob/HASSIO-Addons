ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

LABEL maintainer="Jan Ryklikas <soulofnoob@ymail.com>"

WORKDIR /

ARG OMADA_VER=5.0.30
ARG OMADA_TAR="Omada_SDN_Controller_v${OMADA_VER}_linux_x64.tar.gz"
ARG OMADA_URL="https://static.tp-link.com/upload/software/2022/202201/20220120/${OMADA_TAR}"

# valid values: amd64 (default) | arm64 | armv7l
ARG BUILD_ARCH
ARG ARCH=${BUILD_ARCH}

RUN \
    set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        wget

RUN \
    set -x \
    && wget https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/entrypoint-5.x.sh \
    && mv entrypoint-5.x.sh entrypoint.sh \
    && chmod a+x /entrypoint.sh \
    && wget https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/healthcheck.sh \
    && chmod a+x /healthcheck.sh \
    && wget https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/install.sh \
    && chmod a+x /install.sh \
    && wget https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/log4j_patch.sh \
    && chmod a+x /log4j_patch.sh

RUN \
    set -x \
    && sed -i 's;armv7l;armv7|armv7l;g' install.sh \
    # && sed -i 's;ln -sf;# ln -sf;g' install.sh \
    # && sed -i 's;/opt/tplink/EAPController;/tmp/omada;g' install.sh \
    # && sed -i 's;( mongodb );( mongodb-org );g' install.sh \
    # && sed -i 's;( mongodb-server-core );( nano );g' install.sh \
    # && sed -i 's;/opt/tplink/EAPController;/data/omada;g' entrypoint.sh
    && sed -i 's;/opt/tplink/EAPController/\${DIR};/data/omada/\${DIR};g' entrypoint.sh \
    && sed -i 's;/opt/tplink/EAPController/data;/data/omada/data;g' entrypoint.sh \
    && sed -i 's;/opt/tplink/EAPController/work;/data/omada/work;g' entrypoint.sh \
    && sed -i 's;/opt/tplink/EAPController/logs;/data/omada/logs;g' entrypoint.sh \
    && sed -i 's;exec;#;g' entrypoint.sh 

RUN /install.sh

# patch log4j vulnerability
RUN /bin/sh -c /log4j_patch.sh

RUN usermod --shell /bin/bash omada

VOLUME /data

COPY init.sh /
RUN chmod a+x /init.sh

COPY fixpermissions.sh /
RUN chmod a+x /fixpermissions.sh

COPY rootfs /

WORKDIR /opt/tplink/EAPController/lib
EXPOSE 8088 8043 8843 29810/udp 29811 29812 29813 29814
HEALTHCHECK --start-period=5m CMD /healthcheck.sh