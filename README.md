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

The colour of the remote database you want to find a backup for. For Example, if it was HEROKU_POSTGRESQL_PURPLE_URL you would set the following:

- ``` remote_database: PURPLE ```

The name of the local database you want to restore to
- ``` local_database: local-database-name ```

The name of the app where the database is located. For Example, if the app URL was cake.herokuapp.com you would set the following.
- ``` app: cake ```

### Debugging

When getting a slice of Pistachio data, make sure you have authorization to the AlphaSights heroku app cake-data. After getting authorization,
you may also need to visit the [heroku app site](https://dashboard.heroku.com/apps/cake-data/resources) in your browser to verify you have access.
