# Replace {MY_SITE} with your site title. eg, do a search & replace in VSCode for {MY_SITE} and replace with websitename.
echo 'BEFORE RUNNING THIS SCRIPT: Update the .lando.yml file with your site name.'
echo 'What is the name of your website? (Without the .com.au) This should be the same as in your .lando.yml file:'
read -p 'Site Name:' sitevar
echo 'starting setup...'
# Download the composer spinupwp template
composer create-project spinupwp/spinupwp-composer-site

# move up one directory and remove the old folder.
shopt -s dotglob nullglob
mv -v spinupwp-composer-site/* .
rm -rf spinupwp-composer-site
composer johnpbloch/wordpress:* require wpackagist-plugin/custom-post-type-ui wpackagist-plugin/easy-property-listings wpackagist-plugin/easy-property-listings wpackagist-plugin/easy-property-listings-xml-csv-import wpackagist-plugin/limit-login-attempts-reloaded wpackagist-plugin/spinupwp wpackagist-plugin/seo-by-rank-math wpackagist-plugin/import-xml-csv-settings-to-rank-math-seo wpackagist-plugin/akismet wpackagist-plugin/wp-ses wpackagist-plugin/wordfence wpackagist-plugin/index-wp-mysql-for-speed wpackagist-plugin/simple-history

composer require --dev wpackagist-plugin/current-template-name wpackagist-plugin/query-monitor

#install wordpress and dependencies
composer install

#create the ENV file
touch .env

echo "# ENV variables for Lando
DB_NAME='wordpress'
DB_USER='wordpress'
DB_PASSWORD='wordpress'
DB_HOST='database'
WP_ENV='development'
DB_PREFIX=wp_
WP_HOME='http://$sitevar.lndo.site'
WP_SITEURL='http://$sitevar.lndo.site/wp'" > .env

# download and configure UnderStrap
cd public/content/themes
git clone git@github.com:understrap/understrap.git
mv understrap $sitevar
cd $sitevar
npm install

# Start it up
lando start

# List information about this app
lando info

cat << "EOF"
 ____ _____  _    _____ _____ _     ___ _   _ _  __
 / ___|_   _|/ \  |  ___|  ___| |   |_ _| \ | | |/ /
 \___ \ | | / _ \ | |_  | |_  | |    | ||  \| | ' / 
  ___) || |/ ___ \|  _| |  _| | |___ | || |\  | . \ 
 |____/ |_/_/   \_\_|   |_|   |_____|___|_| \_|_|\_\
                                                    
EOF