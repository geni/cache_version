# CacheVersion

CacheVersion lets you maintain a version for any class. This can be used for cache
invalidation, and RecordCache and MethodCache use it for that. It uses memcache to reduce
database access when the version of a class hasn't changed.

## Usage

```ruby
  CacheVersion.get(User)
  # => 0

  CacheVersion.increment(User)
  CacheVersion.get(User)
  # => 1

  # Or you can use the alternate syntax

  User.version
  # => 1

  User.increment_version
  User.version
  # => 2
```

## Testing

```sh
  echo "CREATE DATABASE cache_version_test" | psql -U postgres
  bundle install --path vendor/bundle --clean
  bundle exec rake test
```

## Installation

Add the follownig line to your Gemfile

```ruby
  gem "cache_version", :branch => 'rails-8.0.x'
```

Also, you need to create a migration to make the cache_versions table. See examples/sample_migration.rb

## Dependencies

* {memcache}[http://github.com/stangel/memcache]
