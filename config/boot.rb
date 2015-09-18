$LOAD_PATH.unshift File.expand_path('../..', __FILE__)

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['PGSPEC_ENV']  ||= 'development'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, ENV['PGSPEC_ENV'].to_sym)

def db_config
  @config ||= YAML.load_file('config/database.yml')
end

ActiveRecord::Base.establish_connection db_config[ENV['PGSPEC_ENV']]
