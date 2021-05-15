module Kgb
  module Dealership
    module Entities
      class Review
        attr_reader :content

        def initialize(content)
          @content = content
        end
      end
    end
  end
end
