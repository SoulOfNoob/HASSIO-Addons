ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

LABEL maintainer="Jan Ryklikas <soulofnoob@ymail.com>"

WORKDIR /

ARG OMADA_VER=5.0.30
ARG OMADA_TAR="Omada_SDN_Controller_v${OMADA_VER}_linux_x64.tar.gz"
ARG OMADA_URL="https://static.tp-link.com/upload/software/2022/202201/20220120/${OMADA_TAR}"

ARG BUILD_ARCH
ARG ARCH=${BUILD_ARCH}

RUN \
    set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        wget

# download scripts from mbentley's omada repo
RUN \
    set -x \
    && wget -O entrypoint.sh https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/entrypoint-5.x.sh \
    && chmod a+x /entrypoint.sh \
    && wget https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/healthcheck.sh \
    && chmod a+x /healthcheck.sh \
    && wget https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/install.sh \
    && chmod a+x /install.sh \
    && wget https://raw.githubusercontent.com/mbentley/docker-omada-controller/master/log4j_patch.sh \
    && chmod a+x /log4j_patch.sh

# replace mongodb packages in install script
# RUN \
#     set -x 
#     # && sed -i 's;( mongodb );( mongodb-org );g' install.sh \
#     # && sed -i 's;( mongodb-server-core );( nano );g' install.sh \

# add armv7 to supported install
RUN \
    set -x \
    && sed -i 's;armv7l;armv7|armv7l;g' install.sh \
    && sed -i 's;amd64|arm64|"";amd64|arm64|aarch64|"";g' install.sh

# set HASSIO path in entrypoint script
RUN \
    set -x \
    sed -i 's;/opt/tplink/EAPController/\${DIR};/data/omada/\${DIR};g' entrypoint.sh \
    && sed -i 's;/opt/tplink/EAPController/data;/data/omada/data;g' entrypoint.sh \
    && sed -i 's;/opt/tplink/EAPController/work;/data/omada/work;g' entrypoint.sh \
    && sed -i 's;/opt/tplink/EAPController/logs;/data/omada/logs;g' entrypoint.sh

# prevent entrypoint from start application
RUN sed -i 's;exec;#;g' entrypoint.sh

# install mongodb and omada controller
RUN /install.sh

# patch log4j vulnerability
RUN /bin/sh -c /log4j_patch.sh

# set default shell to bash
RUN usermod --shell /bin/bash omada

# define volume mountpoint to persist changes
VOLUME /data

# copy data to container
COPY rootfs /
COPY init.sh /
RUN chmod a+x /init.sh
COPY fixpermissions.sh /
RUN chmod a+x /fixpermissions.sh

WORKDIR /opt/tplink/EAPController/lib
EXPOSE 8088 8043 8843 29810/udp 29811 29812 29813 29814
HEALTHCHECK --start-period=5m CMD /healthcheck.sh