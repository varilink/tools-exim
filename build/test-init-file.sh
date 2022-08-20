# Using this as a bash init file when using the test Docker Compose service
# ensures that the configuration that Exim is using is always current.

/usr/sbin/update-exim4.conf --confdir /confdir/ --verbose
