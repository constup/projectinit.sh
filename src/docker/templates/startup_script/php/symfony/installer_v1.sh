#!/bin/bash

cd /usr/src/symfony_temp_install || exit 1
symfony new . --version="~~~framework version~~~.*" --no-git ~~~web app~~~|| exit 1
composer config --json extra.symfony.docker false
#composer require symfony/orm-pack
composer require --dev friendsofphp/php-cs-fixer
composer require --dev~~~unit testing~~~
composer require --dev fakerphp/faker
composer require --dev symfony/maker-bundle
composer require --dev rector/rector
cp -a /usr/src/symfony_temp_install/* /usr/src/app/ || exit 1
cp -a /usr/src/symfony_temp_install/.[!.]* /usr/src/app/ || exit 1
echo "ProjectInit.sh installed Symfony ~~~framework version~~~ successfully. Creating the environment..."
echo "Note: If this process stalls for more than 2 seconds, deselect the terminal window and activate it again..."