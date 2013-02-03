# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-migrate"
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoff Lanotte"]
  s.date = "2012-12-03"
  s.description = "Guard::Migrate automatically runs your database migrations when needed"
  s.email = ["geofflanotte@gmail.com"]
  s.homepage = "http://rubygems.org/gems/guard-migrate"
  s.rdoc_options = ["--charset=UTF-8", "--main=README.rdoc", "--exclude='(lib|test|spec)|(Gem|Guard|Rake)file'"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-migrate"
  s.rubygems_version = "1.8.23"
  s.summary = "Guard gem for rails migrations"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 1.3.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 1.2.1"])
    else
      s.add_dependency(%q<guard>, [">= 1.3.0"])
      s.add_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 1.2.1"])
    end
  else
    s.add_dependency(%q<guard>, [">= 1.3.0"])
    s.add_dependency(%q<rspec>, ["~> 2.11.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 1.2.1"])
  end
end
