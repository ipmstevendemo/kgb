require 'sentimental'

module Kgb
  module SentimentAnalysis
    class Analyzer
      def initialize
        load_sentiment_data
      end

      def score(content)
        score = 0
        content.split(" ").each do |word|
          if sentiment_hash[word]
            score = score + sentiment_hash[word]
          end
        end

        score
      end

      private
      def load_sentiment_data
        @sentiment_hash = {}

        ["#{__dir__}/data/sentislang.txt", "#{__dir__}/data/sentiwords.txt"].each do |file|
          File.open(file).each do |line|
            score, word = line.chomp.split("\t")
            sentiment_hash[word] = score.to_f
          end
        end

        @sentiment_hash
      end

      attr_reader :sentiment_hash
    end
  end
end
