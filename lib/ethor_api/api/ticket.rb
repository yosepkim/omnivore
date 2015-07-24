module EthorApi
  module Api
    class Ticket < Base
      # params[:order_type] - required ['pickup' or 'delivery' or 'dine_in' or 'carry_out']: The order type,
      def create store_id, params
        @client.post("/stores/#{store_id}/tickets", params).body
      end

      def find store_id, order_id, params={}
        @client.get("/stores/#{store_id}/tickets/#{order_id}", params).body
      end

      def submit store_id, order_id, params={}
        @client.post("/stores/#{store_id}/tickets/#{order_id}/submit", params).body
      end

      def add_items store_id, order_id, params={}
        @client.post("/stores/#{store_id}/tickets/#{order_id}/items", params).body
      end

      def add_payments store_id, order_id, params={}
        @client.post("/stores/#{store_id}/tickets/#{order_id}/payments", params).body
      end 

      def void store_id, order_id, params={}
        @client.delete("/stores/#{store_id}/tickets/#{order_id}", params).body
      end 

    end
  end
end
