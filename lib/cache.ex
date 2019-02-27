defmodule RedisClusterTest.Cache do
    use Nebulex.Cache,
        otp_app: :redis_cluster_test,
        adapter: NebulexRedisAdapter
end

defmodule RedisClusterTest.PoolsCache do
    use Nebulex.Cache,
        otp_app: :redis_cluster_test,
        adapter: NebulexRedisAdapter
end