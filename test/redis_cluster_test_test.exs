defmodule RedisClusterTestTest do
  use ExUnit.Case
  doctest RedisClusterTest

  def force_set(cache, key, value) do
    try do
      cache.set(key, value)
    rescue
      _e in Redix.Error -> force_set(cache, key, value)
    end
  end

  def force_get(cache, key) do
    try do
      cache.get(key)
    rescue
      _e in Redix.Error -> force_get(cache, key)
    end
  end

  test "Insert and read 1000 from non pooled cache" do
    for n <- 1..1000 do
      RedisClusterTest.Cache.set("test#{n}", "test")
    end
    for n <- 1..1000 do
      assert RedisClusterTest.Cache.get("test#{n}") == "test"
    end
    RedisClusterTest.Cache.flush()
  end

  test "Insert and read 1000 from non pooled cache with retry" do
    for n <- 1..1000 do
      force_set(RedisClusterTest.Cache, "test#{n}", "test")
    end
    for n <- 1..1000 do
      assert force_get(RedisClusterTest.Cache, "test#{n}") == "test"
    end
    RedisClusterTest.Cache.flush()
  end

  test "Insert and read 1000 from pooled cache" do
    for n <- 1..1000 do
      RedisClusterTest.PoolsCache.set("ptest#{n}", "test")
    end
    for n <- 1..1000 do
      assert RedisClusterTest.PoolsCache.get("ptest#{n}") == "test"
    end
    RedisClusterTest.PoolsCache.flush()
  end

  test "Insert and read 1000 from pooled cache with retry" do
    for n <- 1..1000 do
      force_set(RedisClusterTest.PoolsCache, "ptest#{n}", "test")
    end
    for n <- 1..1000 do
      assert force_get(RedisClusterTest.PoolsCache, "ptest#{n}") == "test"
    end
    RedisClusterTest.PoolsCache.flush()
  end


end
