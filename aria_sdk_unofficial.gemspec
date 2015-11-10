# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aria_sdk_unofficial/version'

Gem::Specification.new do |spec|
  spec.name          = "aria_sdk_unofficial"
  spec.version       = AriaSdkUnofficial::VERSION
  spec.authors       = ["Austin Turner"]
  spec.email         = ["paustint@gmail.com"]

  spec.summary       = "Aria REST SDK based on the official Aria SDK located here: https://github.com/AriaSystems/ruby_sdk"
  spec.description   = "Wrapper to connect to the Aria API's in an easy to use manner"
  spec.homepage      = "https://github.com/paustint/aria_sdk_unofficial"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13"
  spec.add_dependency "json", "~> 1.8"

  spec.add_development_dependency "rspec"
end
