module OmnivoreApi
  module Api
    class TenderType < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/tender_types").body
      end

      def retrieve location_id, tender_type_id
        @client.get("/locations/#{location_id}/tender_types/#{tender_type_id}").body
      end

    end
  end
end