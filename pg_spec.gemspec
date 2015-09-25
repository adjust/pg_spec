# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pg_spec/version'

Gem::Specification.new do |spec|
  spec.name          = "pg_spec"
  spec.version       = PgSpec::VERSION
  spec.authors       = ["Manuel Kniep"]
  spec.email         = ["m.kniep@web.de"]
  spec.summary       = %q{specs for postgres}
  spec.description   = %q{test your sql}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.5"
  spec.add_dependency "rake"
  spec.add_dependency 'minitest', '~> 5.8.0'
  spec.add_dependency 'pg', '> 0.17'
  spec.add_dependency 'pry'
end
