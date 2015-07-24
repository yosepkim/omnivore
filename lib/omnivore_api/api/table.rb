module OmnivoreApi
  module Api
    class Table < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/tables").body
      end

      def retrieve location_id, table_id
        @client.get("/locations/#{location_id}/tables/#{table_id}").body
      end

    end
  end
end