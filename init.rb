require "heroku/command/base"

class Heroku::Command::Db < Heroku::Command::Base

  # cake:sync
  #
  # Enjoy a slice of data
  #
  # You'll need a .cake.conf file in your app directory
  #

  def sync
    capture
    pull
    restore
  end

  private

  def capture
    system %{ heroku pgbackups:capture #{ remote_database } --expire --app #{ app } }
  end

  def pull
    system %{ curl #{ backup_s3_url } > #{ backup_location } }
  end

  def restore
    system %{ pg_restore --clean --no-acl --no-owner -d #{local_database} #{backup_location} }
  end

  def backup_s3_url
    `heroku pgbackups:url #{ backup_id } --app #{ app }`.strip
  end

  def backup_location
    "/tmp/#{ app }-latest.dump"
  end

  def backup_id
    `heroku pgbackups --app #{ app } | grep #{ remote_database }| cut -d " " -f1`.split("\n").last
  end

  # todo don't hardcode this
  def remote_database
    "HEROKU_POSTGRESQL_CHARCOAL_URL"
  end

  def local_database
    "polly_dev"
  end

  def app
    "polly-production"
  end
end
