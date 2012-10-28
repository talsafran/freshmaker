$:.unshift File.expand_path("../lib", __FILE__)

require 'freshmaker/version'

Gem::Specification.new do |gem|
  gem.name        = 'freshmaker'
  gem.version     = Freshmaker::VERSION

  gem.date        = '2012-10-26'
  gem.email       = 'tal@talsafran.com'
  gem.homepage    = 'http://github.com/talsafran/freshmaker'
  gem.summary     = 'Freshmaker – A simple API wrapper for Freshmaker.'
  gem.description = 'A simple API wrapper for Freshmaker.'
  gem.author      = 'Tal Safran'
  gem.license     = 'MIT'

  gem.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(License|README|bin/|data/|ext/|lib/|spec/|test/)} }
  gem.add_dependency 'httparty'
end
