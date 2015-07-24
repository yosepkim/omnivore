module OmnivoreApi
  module Api
    class Store < Base
      def all
        @client.get("/locations").body
      end
    end
  end
end
