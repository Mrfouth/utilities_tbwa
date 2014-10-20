# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utilities_tbwa/version'

Gem::Specification.new do |spec|
  spec.name          = "utilities_tbwa"
  spec.version       = UtilitiesTbwa::VERSION
  spec.authors       = ["Shaun Shang"]
  spec.email         = ["shaun.shang@tbwa.com"]
  spec.summary       = "A simple tool for TBWA web apps"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  s.add_dependency('thor')
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "railties", "~> 3.1"
end
