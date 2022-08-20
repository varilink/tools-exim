# TODO: Make the Debian release configurable
FROM debian:buster

RUN                                                                            \
  apt-get update                                                            && \
  apt-get --yes --no-install-recommends install                                \
    exim4                                                                      \
    tree

COPY exim-conf-diff.sh /usr/local/sbin/exim-conf-diff
COPY test-init-file /

RUN chmod +x /usr/local/sbin/exim-conf-diff
