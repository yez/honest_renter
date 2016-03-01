module HonestRenter
  def snake_case(key)
    key.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
  end

  module_function :snake_case
end

require 'faraday'
require 'logger'
require 'json'
require_relative './requires'
