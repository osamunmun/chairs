# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard"
  s.version = "1.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thibaud Guillaume-Gentil"]
  s.date = "2013-01-27"
  s.description = "Guard is a command line tool to easily handle events on file system modifications."
  s.email = ["thibaud@thibaud.me"]
  s.executables = ["guard"]
  s.files = ["bin/guard"]
  s.homepage = "https://github.com/guard/guard"
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard"
  s.rubygems_version = "1.8.23"
  s.summary = "Guard keeps an eye on your file modifications"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0.14.6"])
      s.add_runtime_dependency(%q<listen>, [">= 0.6.0"])
      s.add_runtime_dependency(%q<pry>, [">= 0.9.10"])
      s.add_runtime_dependency(%q<lumberjack>, [">= 1.0.2"])
      s.add_runtime_dependency(%q<terminal-table>, [">= 1.4.3"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.12.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 2.4.0"])
    else
      s.add_dependency(%q<thor>, [">= 0.14.6"])
      s.add_dependency(%q<listen>, [">= 0.6.0"])
      s.add_dependency(%q<pry>, [">= 0.9.10"])
      s.add_dependency(%q<lumberjack>, [">= 1.0.2"])
      s.add_dependency(%q<terminal-table>, [">= 1.4.3"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.12.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 2.4.0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0.14.6"])
    s.add_dependency(%q<listen>, [">= 0.6.0"])
    s.add_dependency(%q<pry>, [">= 0.9.10"])
    s.add_dependency(%q<lumberjack>, [">= 1.0.2"])
    s.add_dependency(%q<terminal-table>, [">= 1.4.3"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.12.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 2.4.0"])
  end
end
