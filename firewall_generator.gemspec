# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firewall_generator/version'

Gem::Specification.new do |gem|
  gem.name          = "firewall_generator"
  gem.version       = FirewallGenerator::VERSION
  gem.authors       = ["Joshua B. Bussdieker"]
  gem.email         = ["jbussdieker@gmail.com"]
  gem.summary       = %q{Simple firewall generation tool}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency 'aws-sdk', '< 2'
end
