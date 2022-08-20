# Tools - Exim

David Williamson @ Varilink Computing Ltd

------

This repository contains a Docker Compose project that facilitates easy testing on the desktop of configuration setups for the Exim Internet Mailer as packaged for Debian.

## Setup

Before using this repository, you must do three things:

1. Create folder `etc/` (file paths are relative to the project root) containing your Exim configuration under `etc/exim4/` and your `mailname` file in `etc/mailname`
2. Create folder `src/` containing any testing *Helper Scripts* you want to use.
3. Create file `.env` containing values for the `UID` and `GID` of your desktop user account.

## Initialising your Exim configuration

A utility is provided to initialise the contents of your `etc/` folder with the relevant files from the `exim` package in Debian:

```bash
docker-compose run --rm init
```

To ensure that the files created by this are owned by your desktop user on the host, your `.env` file must contain the correct `UID` and `GID`; for example, here are the contents of my `.env` file:

```ini
UID=1000
GID=1000
```

## Keeping track of your Exim configuration changes

As you then make changes to the default Exim configuration provided via the Debian package, it's useful to be able to keep track of what you've changed. For this purpose, this repository provides a `diff` service:

```bash
docker-compose run --rm diff
```

This produces a report of any configuration files that you have added to or deleted from those provided by the package install. It also reports any changes that you have made to configuration files provided by the package install.

## Testing your Exim configuration

When you've made your changes to customise Exim to your specific needs, you can test the results:

```bash
docker-compose run --rm test
```

This will take you into a bash shell in a container having first run `update-exim4.conf` to apply your customised configuration within that container.

```bash
echo "Sending to recipient@example1.com from sender@example2.com"

/usr/sbin/exim -v $1 recipient@example1.com <<- EOM
	To: recipient@example1.com
	From: sender@example2.com
	Subject: Test
	Test sent via the Varilink Exim configuration testing tool.
EOM
```