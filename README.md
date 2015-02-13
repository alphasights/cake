Cake
====

Cake is a heroku plugin that simplfies downloading and restoring the latest backup of your postgres database locally.

## Usage

Navigate to your repository

``` $ cd ~\Repositories\your-project ```

Pull the data :warning:  Destructive

``` $ heroku cake:slice ```

Enjoy your cake ! :cake:  :beer:

## Installation

``` heroku plugins:install git@github.com:alphasights/cake.git ```

### cakefile

You'll need to create a cake.yml in each repository that you want to restore. It requires three pieces of information. Checkout example.cake.yml.

The colour of the remote database you want to find a backup for (HEROKU_POSTGRESQL_COLOUR_URL)
- ``` remote_database: PURPLE ```

The name of the local database you want to restore to
- ``` local_database: local-database-name ```

The name of the app where the database is located
- ``` app: herokuapp-name ```
