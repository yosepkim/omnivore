module OmnivoreApi
  module Api
    class Location < Base
      
      def list
        @client.get("/locations").body
      end

      def retrieve location_id
        @client.get("/locations/#{location_id}").body
      end

    end
  end
end