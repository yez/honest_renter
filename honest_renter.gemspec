lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require './version'

Gem::Specification.new do |s|
  s.name          = 'honest_renter'
  s.version       = HonestRenter::VERSION
  s.summary       = %q{Ruby wrapper for the HonestRenter API}
  s.description   = %q{Find out who will pay rent on time, follow rules, and treat your property with respect.}
  s.authors       = ['Jake Yesbeck']
  s.email         = 'yesbeckjs@gmail.com'
  s.homepage      = 'http://rubygems.org/gems/honest_renter'
  s.license       = 'MIT'

  s.require_paths = ['lib']
  s.files         = `git ls-files`.split("\n")
  s.test_files    = s.files.grep(/^spec\//)

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'faraday', '~> 0.9'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake', '~>10'
end
