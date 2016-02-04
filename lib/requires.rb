# master require file for whole tree
require 'faraday'
require 'client'
require 'request'
require 'response'

['../../models'].each do |dir|
  Dir[File.expand_path("#{dir}/*.rb", __FILE__)].each do |file|
    require file
  end
end
