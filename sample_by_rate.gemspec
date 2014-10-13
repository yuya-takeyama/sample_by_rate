# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sample_by_rate/version'

Gem::Specification.new do |spec|
  spec.name          = "sample_by_rate"
  spec.version       = SampleByRate::VERSION
  spec.authors       = ["Yuya Takeyama"]
  spec.email         = ["sign.of.the.wolf.pentagram@gmail.com"]
  spec.summary       = %q{Method to do sampling for Enumerable objects in specified rate.}
  spec.description   = %q{Method to do sampling for Enumerable objects in specified rate.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.0.1"
end
