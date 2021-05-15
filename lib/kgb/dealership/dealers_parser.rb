require_relative 'entities/dealer'

module Kgb
  module Dealership
    class DealersParser
      def initialize(dealers_json)
        @dealers_json = dealers_json
      end

      def parse
        dealers_json.map do |dealer_json|
          id = dealer_json["dealerId"]
          name = dealer_json["dealerName"]

          Kgb::Dealership::Entities::Dealer.new(id, name)
        end
      end

      private

      attr_reader :dealers_json
    end
  end
end
