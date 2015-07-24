module EthorApi::Api::RestUtils

  private 

    DEFAULT_SERVERS = {
        :sandbox => 'ethor-test.apigee.net/v1',
        :live => 'ethor-prod.apigee.net/v1/'
      }

    def connection(server)
      @conn ||= Faraday.new(:url => 'http://#{DEFAULT_SERVERS[server]}') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def perform_get path, params={}
      perform_request :get, path, params
    end


    def perform_request(request_method, path, params = {})
      connection.get path, options
    end


end