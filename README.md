Cake
====

Cake is a heroku plugin that simplfies downloading and restoring the latest backup of your postgres database.

## Usage

``` heroku cake:slice ```

## Installation

``` heroku plugins:install git@github.com:alphasights/cake.git ```

### cakefile

You'll need to create a cake.yml in each repository that you want to restore. It requires three pieces of information.

The name of the remote database you want to find a backup for
``` remote_database: HEROKU_POSTGRESQL_PURPLE_URL ```

The name of the local database you want to restore to
``` local_database: database-name ```

The name of the app where the database is stored
``` app: herokuapp-name ```

