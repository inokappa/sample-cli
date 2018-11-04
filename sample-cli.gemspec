
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sample_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "sample-cli"
  spec.version       = SampleCli::VERSION
  spec.authors       = ["inokappa"]
  spec.email         = ["inokara@gmail.com"]

  spec.summary       = %q{A sample command line tool.}
  spec.description   = %q{A sample command line tool.}
  spec.homepage      = "https://github.com/inokappa/sample-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "thor"
  spec.add_dependency "aws-sdk"
end
