# Lando WordPress Environment
This is a WordPress development environment based on Lando which we use for WordPress Plugin and theme development. 
[Lando](https://github.com/lando/lando) is an extremely flexible local development environment that is based on [Docker](https://www.docker.com/).

This repository contains the Lando configuration file `.lando.yml` and the script to get started.

## Getting started
Before you get started with this setup I assume that you have:
1. Installed [Lando](https://github.com/lando/lando) and gotten familiar with its basics
1. Got familiar with Lando's [WordPress recipe](https://docs.lando.dev/config/wordpress.html)
1. Read about the various services, tooling, events and routing Lando offers.

## Usage  
1. Configure `.lando.yml`  and replace `{MY_SITE}` with project name
1. (optional) Specify the desired PHP version, web server and database server
1. Update the `install.sh` file with your site details, then run `sh install.sh`
1. Then visit the WordPress folder (`{SITE_NAME}.lndo.site/wordpress/`) and go through install steps

## Info
Lando will automatically set up a database with a user and password and also set an environment variables called `lando info` that contains useful information about how your application can access other Lando services.
``` 
database: wordpress
username: wordpress
password: wordpress
host: database
# for mysql
port: 3306

## Documentation
Refer to Lando's extensive [documentation](https://docs.lando.de).

# [STAFFLINK](https://stafflink.com.au/real-estate-web-design/)
