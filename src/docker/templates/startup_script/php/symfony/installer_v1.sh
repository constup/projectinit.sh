#!/bin/bash

cd /usr/src/symfony_temp_install || exit 1
symfony new . --version="~~~symfony version~~~.*" --no-git ~~~web app~~~|| exit 1
composer require --dev friendsofphp/php-cs-fixer ~~~unit testing~~~
cp -a /usr/src/symfony_temp_install/* /usr/src/app/ || exit 1
echo "ProjectInit.sh installed Symfony ~~~symfony version~~~ successfully. Creating the environment..."
echo "Note: If this process stalls for more than 2 seconds, deselect the terminal window and activate it again..."