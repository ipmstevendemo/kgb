require "kgb/version"

require 'kgb/dealership/entities/dealer'
require 'kgb/dealership/entities/review'
require 'kgb/dealership/dealers_parser'
require 'kgb/dealership/reviews_parser'
require 'kgb/dealership/repository'
require 'kgb/dealership/data_providers/dealer_rater'

require 'kgb/sentiment_analysis/analyzer'

module Kgb
  class Error < StandardError; end
  # Your code goes here...
end
