require 'openssl'

module OmnivoreApi
  class Client

    API_VERSION = 'v1'
    DEFAULT_SERVERS = {
        :sandbox => 'https://omnivore-test.apigee.net',
        :live => 'https://omnivore-prod.apigee.net'
      }

    attr_reader :consumer_key, :consumer_secret, :server, :connection

    def initialize(server, consumer_key = nil, consumer_secret = nil)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
        @server = DEFAULT_SERVERS[server]

        @connection = Faraday.new({ url: @server, ssl: { verify: true }, request: {} }) do |builder|
          # response
          builder.use Faraday::Response::RaiseError
          builder.response :json
          builder.adapter Faraday.default_adapter

          # request
          builder.request :multipart
          builder.request :json
        end
    end

    def store
      OmnivoreApi::Api::Store.new(self)
    end

    def ticket
      OmnivoreApi::Api::Ticket.new(self)
    end

    def menu
      OmnivoreApi::Api::Menu.new(self)
    end

    def get(path, options = {})
      request(:get, parse_query_and_convenience_headers(path, options))
    end

    def post(path, options = {})
      request(:post, parse_query_and_convenience_headers(path, options))
    end

    def delete(path, options = {})
      request(:delete, parse_query_and_convenience_headers(path, options))
    end

    private

    def parse_query_and_convenience_headers(path, options)
      raise 'Path can not be blank.' if path.to_s.empty?
      opts = { body: options[:body] }
      opts[:url]    = path
      opts[:method] = options[:method] || :get
      opts[:timeout] = options[:timeout] || 20
      opts.tap {|p| p[:params] = (options[:params] || {}).merge({ apikey: @consumer_key }) }
    end

    def request(method, options = {})
      url     = "/#{API_VERSION}/" + options.fetch(:url)
      params  = options[:params] || {}
      body    = options[:body].nil? ? nil : options[:body]
      headers = options[:headers]
      timeout = options[:timeout] || 20
      
      @connection.send(method) do |req|
        req.url(url)
        req.params.merge!(params)
        req.body = body.nil? ? nil : body.to_json
        req.options.timeout = timeout
        req.headers['Content-Type'] = 'application/json'
      end
    end
  end
end
