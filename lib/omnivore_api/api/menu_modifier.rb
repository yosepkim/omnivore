module OmnivoreApi
  module Api
    class MenuCategory < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/menu/modifiers").body
      end

      def retrieve location_id, modifier_id
        @client.get("/locations/#{location_id}/menu/modifiers/#{modifier_id}").body
      end

    end
  end
end