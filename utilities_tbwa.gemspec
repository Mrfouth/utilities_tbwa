# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'utilities_tbwa/version'

Gem::Specification.new do |spec|
  spec.name          = "utilities_tbwa"
  spec.version       = UtilitiesTbwa::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Shaun Shang"]
  spec.email         = ["shaun.shang@tbwa.com"]
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/shaunshang/utilities_tbwa"
  spec.summary       = "A simple Sass tool for TBWA web apps"
  spec.description   = ""

  spec.rubyforge_project = "utilities_tbwa"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency('sass', '~> 3.3')
  spec.add_dependency('thor')
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "railties", "~> 3.1"
  spec.add_development_dependency('aruba', '~> 0.4')
end
