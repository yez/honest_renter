# master require file for whole tree
require_relative 'client'
require_relative 'request'
require_relative 'response'
require_relative 'session'
require_relative 'authenticator'
require_relative '../models/base_model'
require_relative 'requests/expandable'

[
  '../../modules',
  '../../models',
  '../requests'
].each do |dir|
  Dir[File.expand_path("#{dir}/*.rb", __FILE__)].each do |file|
    require file
  end
end
