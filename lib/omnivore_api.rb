require "omnivore_api/version"

module OmnivoreApi
  require 'omnivore_api/client'

  require 'omnivore_api/api/base'
  require 'omnivore_api/api/store'
  require 'omnivore_api/api/ticket'
  require 'omnivore_api/api/menu'

  # dependencies
  require 'faraday'
  require 'faraday_middleware'

end
