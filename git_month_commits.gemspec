# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_month_commits/version'

Gem::Specification.new do |spec|
  spec.name          = "git_month_commits"
  spec.version       = GitMonthCommits::VERSION
  spec.authors       = ["Tomohiko Himura"]
  spec.email         = ["eiel.hal@gmail.com"]
  spec.summary       = %q{show last month git log}
  spec.description   = %q{show last month git log}
  spec.homepage      = "https://github.com/eiel/git_month_commits"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rugged", "~> 0.21"
  spec.add_dependency "activesupport", "~> 4.2"
  spec.add_dependency "launchy", "~> 2.4.3"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
