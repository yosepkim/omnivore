module OmnivoreApi
  module Api
    class Menu < Base
      def retrieve location_id
        @client.get("/locations/#{location_id}/menu").body
      end
    end
  end
end
