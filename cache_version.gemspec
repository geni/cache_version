lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "cache_version"
  gem.version       = IO.read('VERSION')
  gem.authors       = ["Justin Balthrop"]
  gem.email         = ["git@justinbalthrop.com"]
  gem.description   = %q{Store the version of any class for cache invalidation}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/ninjudd/model_set"
  gem.license       = 'MIT'

  gem.add_dependency 'memcache'
  gem.add_dependency 'activerecord', '~> 3.0.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
