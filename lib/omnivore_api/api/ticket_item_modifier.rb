module OmnivoreApi
  module Api
    class TicketItemModifier < Base
      
      def list location_id, ticket_id, ticket_item_id
        @client.get("/locations/#{location_id}/tickets/#{ticket_id}/items/#{ticket_item_id}/modifiers").body
      end

      def retrieve location_id, ticket_id, ticket_item_id, ticket_item_modifier_id
        @client.get("/locations/#{location_id}/tickets/#{ticket_id}/items/#{ticket_item_id}/modifiers/#{ticket_item_modifier_id}").body
      end

    end
  end
end