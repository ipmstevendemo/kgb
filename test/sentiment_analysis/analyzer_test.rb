require_relative "../test_helper"

module Kgb
  module SentimentAnalysis
    class AnalyzerTest < Minitest::Test
      def test_score
        analyzer = Kgb::SentimentAnalysis::Analyzer.new

        assert_equal 1.75, analyzer.score("This is awesome ;)")
        assert_equal (-0.40625), analyzer.score("I am sick today")
        assert_equal 1.5625, analyzer.score("you are the best <3")
        assert_equal 1, analyzer.score("Happy Birthday (o;")
      end
    end
  end
end
