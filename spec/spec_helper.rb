require 'bundler/setup'
require 'simplecov'
require 'pry'
SimpleCov.start

Bundler.setup

require 'omnivore_api' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end