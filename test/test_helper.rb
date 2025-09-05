require 'bundler'
require 'test/unit'

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../memcache/lib"

require 'cache_version'

CACHE = Memcache.new(:servers => ['localhost'])
ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :host     => 'localhost',
  :username => 'postgres',
  :password => '',
  :database => 'cache_version_test'
)
ActiveRecord::Migration.verbose = false
ActiveRecord::Base.connection.client_min_messages = 'error'
