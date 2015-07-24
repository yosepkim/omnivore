module EthorApi
  module Api
    class Store < Base
      def all
        @client.get("/stores").body
      end
    end
  end
end
