module OmnivoreApi
  module Api
    class MenuCategory < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/menu/categories").body
      end

      def retrieve location_id, category_id
        @client.get("/locations/#{location_id}/menu/categories/#{category_id}").body
      end

    end
  end
end