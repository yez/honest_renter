module HonestRenter
  class Filter
    attr_accessor :key, :value
    def initialize(key, value)
      @key = key
      @value = value
    end
  end
end
