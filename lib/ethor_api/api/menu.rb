module EthorApi
  module Api
    class Menu < Base
      def find_menu_item store_id, item_id, params={}
        @client.get("/stores/#{store_id}/menu/items/#{item_id}", params).body
      end

      def all store_id, params={}
        @client.get("/stores/#{store_id}/menu", params).body
      end
    end
  end
end
