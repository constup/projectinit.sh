if ! php /usr/src/app/bin/console doctrine:database:create
then
    echo "Database could not be created, but it might already exist. Trying to continue the script..."
fi
php /usr/src/app/bin/console doctrine:migrations:migrate --allow-no-migration || exit 1