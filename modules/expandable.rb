module HonestRenter
  module Expandable
    def expanding(attribute)
      @expansions ||= []
      @expansions << attribute

      self
    end
  end
end
