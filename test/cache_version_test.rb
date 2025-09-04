require_relative 'test_helper'

class CacheVersionTest < Test::Unit::TestCase

  def self.startup
    system('memcached -d')
    CacheVersionMigration.up
  end

  def self.shutdown
    system('killall memcached')
    CacheVersionMigration.down
  end

  test 'increment_version' do
    5.times do |i|
      assert_equal i, Object.version
      Object.increment_version
      assert_equal i + 1, Object.version
    end

    CacheVersion.clear_cache
    assert_equal 5, Object.version
  end

end # class CacheVersionTest
