require_relative "../test_helper"

module Kgb
  module Dealership
    class RepositoryTest < Minitest::Test
      def test_find_dealer
        data_provider = Object.new
        data_provider.expects(:find_dealer).with("a").returns([Kgb::Dealership::Entities::Dealer.new(1, "a")])

        repository = Kgb::Dealership::Repository.new(data_provider: data_provider)

        dealers = repository.find_dealer("a")
        assert_equal 1, dealers.first.id
        assert_equal "a", dealers.first.name
      end

      def test_find_reviews
        data_provider = Object.new
        data_provider.expects(:find_reviews).with("dealer", [1]).returns([Kgb::Dealership::Entities::Review.new("good review")])

        repository = Kgb::Dealership::Repository.new(data_provider: data_provider)

        reviews = repository.find_reviews('dealer', [1])
        assert_equal 1, reviews.size
        assert_equal "good review", reviews.first.content
      end
    end
  end
end
