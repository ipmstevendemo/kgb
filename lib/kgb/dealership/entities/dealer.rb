module Kgb
  module Dealership
    module Entities
      class Dealer
        attr_reader :id, :name, :reviews

        def initialize(id, name, reviews = [])
          @id = id
          @name = name
          @reviews = reviews
        end
      end
    end
  end
end
