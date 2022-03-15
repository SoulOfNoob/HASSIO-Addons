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

# create omada folder
RUN mkdir -p ${OMADA_DIR}

# copy from parent image
COPY --from=mbentley ${OMADA_DIR} ${OMADA_DIR}
COPY --from=mbentley /entrypoint.sh /entrypoint.sh
COPY --from=mbentley /healthcheck.sh /healthcheck.sh

# install dependencies
COPY /setup.sh /
RUN \
    set -x \
    && chmod a+x /setup.sh \
    && /setup.sh \
    && rm -f /setup.sh \
    && apt-get install -y --no-install-recommends \
        gosu \
        openjdk-8-jre-headless \
        wget

# copy from filesystem
COPY /rootfs /
COPY /init.sh /
RUN chmod a+x /init.sh

# define volume mountpoint to persist changes
VOLUME [ "/data", "/share" ]

WORKDIR ${OMADA_DIR}/lib
EXPOSE 8088 8043 8843 29810/udp 29811 29812 29813 29814
HEALTHCHECK --start-period=5m CMD /healthcheck.sh