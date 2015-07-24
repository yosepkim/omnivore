module OmnivoreApi
  module Api
    class Ticket < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/tickets").body
      end

      def open location_id, params
        @client.post("/locations/#{location_id}/tickets", params).body
      end

      def retrieve location_id, ticket_id
        @client.post("/locations/#{location_id}/tickets/#{ticket_id}").body
      end

      def void location_id, ticket_id, params = {}
        @client.post("/locations/#{location_id}/tickets/#{ticket_id}", params).body
      end 

    end
  end
end
