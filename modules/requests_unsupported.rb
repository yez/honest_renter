module HonestRenter
  module Unrequestable
    class Unsupported < StandardError; end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def find_all(*)
        raise Unsupported, "this model may not use the #{__method__} method."
      end

      def find(*)
        raise Unsupported, "this model may not use the #{__method__} method."
      end
    end

    private_constant :Unsupported
  end
end
