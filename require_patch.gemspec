# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'require_patch/version'

Gem::Specification.new do |spec|
  spec.name          = "require_patch"
  spec.version       = RequirePatch::VERSION
  spec.authors       = ["Roman Shipiev"]
  spec.email         = ["roman@shipiev.pro"]
  spec.summary       = %q{The gem adds a command "require_patch" that connects patches plugins}
  spec.description   = %q{The gem used by our team to develop Redmine plugins}
  spec.homepage      = "https://github.com/shipiev/require_patch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
