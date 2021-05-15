require_relative "../../test_helper"

module Kgb
  module Dealership
    module DataProviders
      class DealerRaterTest < Minitest::Test
        def test_find_dealer
          http_json_client = Object.new
          response = stub(body: '[{"dealerId":123, "dealerName":"awesome dealer"}]')
          http_json_client.stubs(:get).returns(response)
          Kgb::Dealership::DataProviders::DealerRater.any_instance.stubs(:http_json_client).returns(http_json_client)

          dealer_rater = Kgb::Dealership::DataProviders::DealerRater.new
          dealers = dealer_rater.find_dealer("McKaig Chevrolet Buick")

          assert_equal 1, dealers.size
          assert_equal 123, dealers.first.id
          assert_equal "awesome dealer", dealers.first.name
        end

        def test_find_reviews
          http_client = Object.new
          response = stub(body: load_fixture("mckaig_chevrolet_buick.html"))
          http_client.stubs(:get).returns(response)
          Kgb::Dealership::DataProviders::DealerRater.any_instance.stubs(:http_client).returns(http_client)
          dealer = stub(id: 123, name: "awesome dealer")

          dealer_rater = Kgb::Dealership::DataProviders::DealerRater.new
          reviews = dealer_rater.find_reviews(dealer, [1])

          assert_equal 10, reviews.size
          expected_content = "From beginning to end this dealership was helpful, enthusiastic and knowledgeable about their inventory. Will definitely buy from this dealership again. Thank you so much for your great service to customers."
          assert_equal expected_content, reviews.first.content
        end
      end
    end
  end
end
