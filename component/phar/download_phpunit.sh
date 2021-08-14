echo ""
curl "https://phar.phpunit.de/phpunit-9.phar" --output phpunit.phar
chmod +x phpunit.phar
echo ""
php phpunit.phar --version
