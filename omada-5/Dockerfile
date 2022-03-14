ARG BUILD_FROM
FROM mbentley/omada-controller:5.0 AS mbentley

ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG OMADA_DIR="/opt/tplink/EAPController"
ARG OMADA_PERSIST="/share/omada"
ARG BUILD_ARCH
ARG ARCH=${BUILD_ARCH}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

LABEL maintainer="Jan Ryklikas <soulofnoob@ymail.com>"

WORKDIR /

RUN mkdir -p ${OMADA_DIR}
COPY --from=mbentley ${OMADA_DIR} ${OMADA_DIR}
COPY --from=mbentley /entrypoint.sh /entrypoint.sh
COPY --from=mbentley /healthcheck.sh /healthcheck.sh

RUN \
    set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        gosu \
        openjdk-8-jre-headless \
        wget

COPY custom_install.sh / 
RUN chmod a+x /custom_install.sh
RUN /custom_install.sh

# copy data to container
COPY rootfs /
COPY init.sh /
RUN chmod a+x /init.sh
COPY fixpermissions.sh /
RUN chmod a+x /fixpermissions.sh

# define volume mountpoint to persist changes
VOLUME [ "/data", "/share" ]

WORKDIR /opt/tplink/EAPController/lib
EXPOSE 8088 8043 8843 29810/udp 29811 29812 29813 29814
HEALTHCHECK --start-period=5m CMD /healthcheck.sh