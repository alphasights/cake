Cake
====

Cake is a heroku plugin that simplfies downloading and restoring the latest backup of your postgres database.

## Usage

``` heroku cake:slice ```

## Installation

``` heroku plugins:install git@github.com:alphasights/cake.git ```

### cakefile

You'll need to create a cake.yml in each repository that you want to restore.

remote_database: HEROKU_POSTGRESQL_PURPLE_URL
local_database: database-name
app: herokuapp-name

