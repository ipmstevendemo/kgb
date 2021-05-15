require_relative 'lib/kgb/version'

Gem::Specification.new do |spec|
  spec.name          = "kgb"
  spec.version       = Kgb::VERSION
  spec.authors       = ["Yunlei Liu"]
  spec.email         = ["hello@world.com"]

  spec.summary       = "kgb"
  spec.description   = "kgb"
  spec.homepage      = "http://kgb.test.demo"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://kgb.test.demo"
  spec.metadata["changelog_uri"] = "http://kgb.test.demo"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "faraday", "~> 1.4.1"
  spec.add_dependency "faraday_middleware", "~> 1.0.0"
  spec.add_dependency "sentimental", "~> 1.5.0"
  spec.add_dependency "dry-cli", "~> 0.6.0"
  spec.add_dependency "capybara", "~> 3.35.3"
  spec.add_dependency "activesupport", "~> 6.1.0"
end
