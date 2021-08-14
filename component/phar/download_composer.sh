echo ""
curl "https://getcomposer.org/composer.phar" --output composer.phar
php composer.phar self-update
echo ""
php composer.phar --version
