# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ethor_api/version'

Gem::Specification.new do |spec|
  spec.name          = "omnivore_api"
  spec.version       = OmnivoreApi::VERSION
  spec.authors       = ["KevinColemanInc"]
  spec.email         = ["kevin.coleman@sparkstart.io"]
  spec.summary       = %q{Ethor Gem for their api.}
  spec.homepage      = "https://github.com/Ampersand-Labs/ethor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry'
  
  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"

end
