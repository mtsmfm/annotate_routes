# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'annotate_routes/version'

Gem::Specification.new do |spec|
  spec.name          = "annotate_routes"
  spec.version       = AnnotateRoutes::VERSION
  spec.authors       = ["Fumiaki MATSUSHIMA"]
  spec.email         = ["mtsmfm@gmail.com"]
  spec.summary       = %q{Annotate Rails routes}
  spec.description   = %q{Annotate Rails routes to your controllers}
  spec.homepage      = "https://github.com/mtsmfm/annotate_routes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'rails', '> 3.2'
end
