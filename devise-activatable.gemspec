# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/activatable/version'

Gem::Specification.new do |spec|
  spec.name          = "devise-activatable"
  spec.version       = Devise::Activatable::VERSION.dup
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Leonid Stoianov"]
  spec.email         = ["leo@phar.com.ua"]
  spec.summary       = %q{Activatable plugin for Devise. Adds SMS and Voice activation option}
  spec.homepage      = "https://github.com/dannecker/devise-activatable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "devise",                         ">= 4.0.0", "< 4.2.0"

  spec.add_development_dependency "rails",              "~> 4.2"
  spec.add_development_dependency "rspec-rails",        "~> 3.0"
  spec.add_development_dependency "pry",                "~> 0.10"
  spec.add_development_dependency "factory_girl_rails", "~> 4.4"
  spec.add_development_dependency "timecop",            "~> 0.7"
  spec.add_development_dependency "bundler",            "~> 1.11"

  # Fix database connection with sqlite3 and jruby
  if    RUBY_ENGINE == 'ruby'
    spec.add_development_dependency "sqlite3",          "~> 1.3"
  elsif RUBY_ENGINE == 'jruby'
    spec.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  end
end
