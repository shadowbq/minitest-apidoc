# -*- encoding: utf-8 -*-
# stub: minitest-apidoc 0.3.0 ruby lib
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'minitest/apidoc/version'

Gem::Specification.new do |s|
  s.name = "minitest-apidoc"
  s.version = Minitest::Apidoc::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["git@lap.fi"]
  s.date = "2015-11-05"
  s.description = "Generate API documentation from Minitest specs"
  s.email = ["git@lap.fi"]
  s.files = [".gitignore", "Gemfile", "README.md", "minitest-apidoc.gemspec"] + Dir.glob("{lib}/**/*")
  s.homepage = "https://github.com/kovalo/minitest-apidoc"
  s.rubygems_version = "2.4.8"
  s.summary = "Generate API documentation from Minitest specs"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, [">= 5.5.0"])
      s.add_runtime_dependency(%q<rack-test>, ["~> 0.6.0"])
      s.add_runtime_dependency(%q<mustache>, [">= 0"])
      s.add_runtime_dependency(%q<coderay>, ["~> 1.1"])
    else
      s.add_dependency(%q<minitest>, [">= 5.5.0"])
      s.add_dependency(%q<rack-test>, ["~> 0.6.0"])
      s.add_dependency(%q<mustache>, [">= 0"])
      s.add_dependency(%q<coderay>, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 5.5.0"])
    s.add_dependency(%q<rack-test>, ["~> 0.6.0"])
    s.add_dependency(%q<mustache>, [">= 0"])
    s.add_dependency(%q<coderay>, ["~> 1.1"])
  end
end
