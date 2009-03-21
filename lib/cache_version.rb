require 'rubygems'
require 'active_record'
require 'memcache_extended'

module CacheVersion
  VERSION = '0.9.2'

  def self.db
    ActiveRecord::Base.connection
  end
  
  def self.cache
    CACHE
  end

  def self.get(key)
    key = key.to_s    
    version_by_key[key] ||= CACHE.get_or_set(cache_key(key)) do    
      db.select_value("SELECT version FROM cache_versions WHERE key = '#{key}'").to_i
    end
  end

  def self.increment(key)
    key = key.to_s
    db.execute("INSERT INTO cache_versions (key, version) VALUES ('#{key}', 1)")
  rescue ActiveRecord::StatementInvalid
    db.execute("UPDATE cache_versions SET version = version + 1 WHERE key = '#{key}'")
  ensure
    invalidate_cache(key)    
  end

  def self.invalidate_cache(key)
    key = key.to_s
    cache.delete(cache_key(key))
    version_by_key.delete(key)
  end
  
  def self.clear_cache
    @version_by_key = {}
  end

private
  
  def self.version_by_key
    @version_by_key ||= {}
  end  
    
  def self.cache_key(key)
    "v:#{key}"
  end
end

class Module
  def version
    CacheVersion.get(self)
  end

  def increment_version
    CacheVersion.increment(self)
  end
end

class CacheVersionMigration < ActiveRecord::Migration
  def self.up
    create_table :cache_versions, :id => false do |t|
      t.column :key, :string
      t.column :version, :integer, :default => 0
    end

    add_index :cache_versions, :key, :unique => true
  end

  def self.down
    drop_table :cache_versions
  end
end