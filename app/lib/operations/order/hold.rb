module Operations
  module Order
    class Hold < Operation
      attribute :contractor
      attribute :order_id

      validates :contractor, presence: true
      validates :order, presence: true

      def process
        @order.status = "holded"
        @order.save

        success
      end

      protected

      def order
        return nil unless order_id.present?

        @order ||= ::Order.find order_id
      rescue
        nil
      end

    end
  end
end
