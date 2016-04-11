require './server'

$stdout.sync = true

run Rails.application

require ::File.expand_path('../config/environment', __FILE__)
