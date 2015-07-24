module OmnivoreApi
  module Api
    class OrderType < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/order_types").body
      end

      def retrieve location_id, order_type_id
        @client.get("/locations/#{location_id}/order_types/#{order_type_id}").body
      end

    end
  end
end