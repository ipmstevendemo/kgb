require "active_support/core_ext/string/inflections"
require 'json'
require 'faraday'
require 'faraday_middleware'

module Kgb
  module Dealership
    module DataProviders
      class DealerRater
        attr_reader :source

        def initialize
          @source = "https://www.dealerrater.com"
        end

        def find_dealer(dealer_name)
          response = http_json_client.get("/json/dealer/dealersearch?MaxItems=7&term=#{dealer_name}")

          dealers_json = JSON.parse(response.body)
          Kgb::Dealership::DealersParser.new(dealers_json).parse
        end

        def find_reviews(dealer, pages = [])
          reviews = []
          pages.each do |page|
            response = http_client.get get_dealer_review_url(dealer, page)
            reviews = reviews + Kgb::Dealership::ReviewsParser.new(response.body).parse
          end
          reviews
        end

        private

        def get_dealer_review_url(dealer, page_number=1)
          dealer_review_id = dealer.name + " dealer reviews #{dealer.id}"
          dealer_review_id_segment = ActiveSupport::Inflector.parameterize(dealer_review_id, separator: '-', preserve_case: true)

          ["dealer", dealer_review_id_segment, "page#{page_number}"].join("/")
        end

        def http_json_client
          headers = json_request_header.merge user_agent_header

          Faraday.new(url: source, headers: headers) do |f|
            f.options.timeout = 5
            f.request :retry, http_retry_options
            # f.response :logger, nil, { bodies: false, log_level: :debug }
          end
        end

        def http_client
          headers = user_agent_header

          Faraday.new(url: source, headers: headers) do |f|
            f.use FaradayMiddleware::FollowRedirects
            f.options.timeout = 5
            f.request :retry, http_retry_options
            # f.response :logger, nil, { bodies: false, log_level: :debug }
          end
        end

        def json_request_header
          {
            "Accept" => "application/json, text/javascript, */*; q=0.01",
            "Referer" => "https://www.dealerrater.com/?__optnav=1",
          }
        end

        def user_agent_header
          {
            "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
          }
        end

        def http_retry_options
          {
            max: 5,
            interval: 0.05,
            interval_randomness: 0.5,
            backoff_factor: 2
          }
        end
      end
    end
  end
end
