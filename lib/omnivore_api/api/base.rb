module OmnivoreApi
  module Api
    class Base

      attr_accessor :client

      def initialize(client)
        @client = client
      end

    end
  end
end