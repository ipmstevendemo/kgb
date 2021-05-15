$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "kgb"

require "minitest/autorun"
require 'mocha/minitest'

def load_fixture(filename)
  File.read("#{__dir__}/fixtures/reviews/#{filename}")
end
