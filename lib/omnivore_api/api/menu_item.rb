module OmnivoreApi
  module Api
    class MenuItem < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/menu/items").body
      end

      def retrieve location_id, menu_item_id
        @client.get("/locations/#{location_id}/menu/items/#{menu_item_id}").body
      end

    end
  end
end