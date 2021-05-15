require 'capybara'
require_relative 'entities/review'

module Kgb
  module Dealership
    class ReviewsParser
      def initialize(raw_html)
        @raw = raw_html
      end

      def parse
        page = Capybara::Node::Simple.new(raw)
        page.all(".review-entry .review-content").map do |review_content|
          Kgb::Dealership::Entities::Review.new(review_content.text)
        end
      end

      private
      attr_reader :raw
    end
  end
end
