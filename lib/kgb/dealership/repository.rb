require_relative 'data_providers/dealer_rater'

module Kgb
  module Dealership
    class Repository

      def initialize(data_provider: DataProviders::DealerRater.new)
        @data_provider = data_provider
      end

      def find_dealer(dealer_name)
        data_provider.find_dealer(dealer_name)
      end

      def find_reviews(dealer, pages = [])
        data_provider.find_reviews(dealer, pages)
      end

      private
      attr_reader :data_provider
    end
  end
end
