# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ebanx/version'

Gem::Specification.new do |spec|
  spec.name          = "ebanx"
  spec.version       = Ebanx::VERSION
  spec.authors       = ["Gustavo Henrique Mascarenhas Machado"]
  spec.email         = ["guhemama@gmail.com"]
  spec.summary       = "Ruby bindings for the EBANX API"
  spec.description   = "EBANX is the market leader in e-commerce payment solutions for International Merchants selling online to Brazil"
  spec.homepage      = "https://www.ebanx.com"
  spec.license       = "BSD"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"

  spec.add_dependency 'rest-client', '~> 1.5'
end