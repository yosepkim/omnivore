require "ethor_api/version"

module EthorApi
  require 'ethor_api/client'

  require 'ethor_api/api/base'
  require 'ethor_api/api/store'
  require 'ethor_api/api/ticket'
  require 'ethor_api/api/menu'

  # dependencies
  require 'faraday'
  require 'faraday_middleware'

end
