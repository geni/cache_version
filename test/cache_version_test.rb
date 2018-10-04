require_relative 'test_helper'

describe 'with a memcache and db connection' do
  before do
    system('memcached -d')
    CacheVersionMigration.up
  end

  after do
    system('killall memcached')
    CacheVersionMigration.down
  end

  it 'will increment cache version' do
    5.times do |i|
      assert_equal i, Object.version
      Object.increment_version
      assert_equal i + 1, Object.version
    end
    CacheVersion.clear_cache
    assert_equal 5, Object.version
  end
end
