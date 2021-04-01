
FROM odoo:14.0
MAINTAINER morris "cc12703@gmail.com"

USER root

ARG ODOO_RELEASE=20201230
ARG ODOO_SHA=1201b6a8088aa312dfab01fc3ac7a52e1386d742

RUN apt-get remove -y odoo  \
    && curl -o odoo.deb -sSL http://nightly.odoo.com/${ODOO_VERSION}/nightly/deb/odoo_${ODOO_VERSION}.${ODOO_RELEASE}_all.deb \
    && echo "${ODOO_SHA} odoo.deb" | sha1sum -c - \
    && apt-get update \
    && apt-get -y install --no-install-recommends ./odoo.deb \
    && rm -rf /var/lib/apt/lists/* odoo.deb


RUN mkdir -p /mnt/dev-addons \
    && chown -R odoo /mnt/dev-addons

VOLUME ["/mnt/dev-addons"]


USER odoo