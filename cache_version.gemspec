# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cache_version}
  s.version = "0.9.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Balthrop"]
  s.date = %q{2009-11-20}
  s.description = %q{Store the version of any class for cache invalidation}
  s.email = %q{code@justinbalthrop.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "cache_version.gemspec",
     "examples/sample_migration.rb",
     "lib/cache_version.rb",
     "test/cache_version_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/ninjudd/cache_version}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Store the version of any class for cache invalidation}
  s.test_files = [
    "test/cache_version_test.rb",
     "test/test_helper.rb",
     "examples/sample_migration.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<memcache>, [">= 1.0.0"])
    else
      s.add_dependency(%q<memcache>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<memcache>, [">= 1.0.0"])
  end
end
