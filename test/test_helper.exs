{:ok, _local} = RedisClusterTest.Cache.start_link()
{:ok, _} = RedisClusterTest.PoolsCache.start_link()

ExUnit.start()
