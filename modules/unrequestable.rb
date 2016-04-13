module HonestRenter
  module Unrequestable
    class Unsupported < StandardError; end

    def included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      class << self
        def find_all(*)
          raise Unsupported, "this model may not use the #{__method__} method."
        end

        def find(*)
          raise Unsupported, "this model may not use the #{__method__} method."
        end
      end
    end

    private_constant :Unsupported
  end
end
