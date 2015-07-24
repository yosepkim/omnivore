module OmnivoreApi
  module Api
    class MenuModifierGroup < Base
      
      def list location_id, menu_item_id
        @client.get("/locations/#{location_id}/menu/items/#{menu_item_id}/modifier_groups").body
      end

      def retrieve location_id, menu_item_id, modifier_group_id
        @client.get("/locations/#{location_id}/menu/items/#{menu_item_id}/modifier_groups/#{modifier_group_id}").body
      end

    end
  end
end