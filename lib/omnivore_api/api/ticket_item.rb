module OmnivoreApi
  module Api
    class TicketItem < Base
      
      def list location_id, ticket_id
        @client.get("/locations/#{location_id}/tickets/#{ticket_id}/items").body
      end

      def add location_id, ticket_id, params
        @client.post("/locations/#{location_id}/tickets/#{ticket_id}/items", params).body
      end

      def retrieve location_id, ticket_id, ticket_item_id
        @client.get("/locations/#{location_id}/tickets/#{ticket_id}/items/#{ticket_item_id}").body
      end

      def void location_id, ticket_id, ticket_item_id
        @client.delete("/locations/#{location_id}/tickets/#{ticket_id}/items/#{ticket_item_id}").body
      end 
      
    end
  end
end