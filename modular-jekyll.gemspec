# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'modular-jekyll/version'

Gem::Specification.new do |spec|
  spec.name          = "modular-jekyll"
  spec.version       = ModularJekyll::VERSION
  spec.authors       = ["Scott Dover"]
  spec.email         = ["sdover102@gmail.com"]

  spec.summary       = %q{A modular approach to Jekyll}
  spec.homepage      = "https://github.com/scottdover/modular-jekyll"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'jekyll', '~> 3.0'
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
