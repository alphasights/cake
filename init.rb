require "heroku/command/base"
require 'open-uri'
require 'yaml'

class Heroku::Command::Cake < Heroku::Command::Base

  # cake:sync
  #
  # Enjoy a slice of data
  #
  # You'll need a cake.yml file in your app directory
  #
  # -c, --capture  # Capture a new copy of the db in question first

  def slice
    capture if capture?
    pull
    restore
  end

  private

  def capture
    system %{ heroku pgbackups:capture #{ remote_database } --expire --app #{ app } }
  end

  def capture?
    options.fetch(:capture, false)
  end

  def pull
    puts "Downloading database from S3..."
    open(backup_location, 'wb') do |file|
      file << open(backup_s3_url).read
    end
  end

  def restore
    `pg_restore --clean --no-acl --no-owner --jobs#{cpu_cores} -d #{local_database} #{backup_location}`
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

  def remote_database
    config['remote_database']
  end

  def local_database
    config['local_database']
  end

  def app
    config['app']
  end

  def cpu_cores
    Integer(`sysctl -n hw.ncpu`) rescue 3
  end

  def config
    @config ||= YAML::load(File.open('cake.yml'))
  end
end
