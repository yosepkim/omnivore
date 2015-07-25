require 'openssl'

module OmnivoreApi
  class Client

    API_VERSION = '0.1'
    DEFAULT_SERVER = 'https://api.omnivore.io/'

    attr_reader :api_key, :server, :connection

    def initialize(api_key)
        @api_key = api_key
        @server = DEFAULT_SERVER

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

    def employee
      OmnivoreApi::Api::Employee.new(self)
    end

    def location
      OmnivoreApi::Api::Location.new(self)
    end

    def menu
      OmnivoreApi::Api::Menu.new(self)
    end

    def menu_category
      OmnivoreApi::Api::MenuCategory.new(self)
    end

    def menu_item
      OmnivoreApi::Api::MenuItem.new(self)
    end

    def menu_modifier
      OmnivoreApi::Api::MenuModifier.new(self)
    end

    def menu_modifier_group
      OmnivoreApi::Api::MenuModifierGroup.new(self)
    end

    def order_type
      OmnivoreApi::Api::OrderType.new(self)
    end

    def table
      OmnivoreApi::Api::Table.new(self)
    end

    def tender_type
      OmnivoreApi::Api::TenderType.new(self)
    end

    def ticket
      OmnivoreApi::Api::Ticket.new(self)
    end

    def ticket_item
      OmnivoreApi::Api::TicketItem.new(self)
    end

    def ticket_item_modifier
      OmnivoreApi::Api::TicketItemModifier.new(self)
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
        req.headers['Api-Key'] = api_key
      end
    end
  end
end
