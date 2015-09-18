require 'rubygems'
require 'pg_spec'

ENV['PGSPEC_ENV']  ||= 'test'
require File.expand_path('../../config/boot', __FILE__)

ActiveRecord::Base.logger.level = 0 if ActiveRecord::Base.logger

Dir.glob('spec/support/**/*.rb').each { |f| require f }

