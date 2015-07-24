module OmnivoreApi
  module Api
    class Employee < Base
      
      def list location_id
        @client.get("/locations/#{location_id}/employees").body
      end

      def retrieve location_id, employee_id
        @client.get("/locations/#{location_id}/employees/#{employee_id}").body
      end

    end
  end
end