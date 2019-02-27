# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# third-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :redis_cluster_test, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:redis_cluster_test, :key)
#
# You can also configure a third-party app:
#
#     config :logger, level: :info
#

config :redis_cluster_test, RedisClusterTest.Cache,
  pools: [
    primary: [
      url: "redis://cluster:7000,cluster:7001,cluster:7002,cluster:7003,cluster:7004,cluster:7005"
    ],
    #=> maybe more pools
  ]

config :redis_cluster_test, RedisClusterTest.PoolsCache,
  pools: [
    primary: [
      url: "redis://cluster:7000"
    ],
    primary2: [
      url: "redis://cluster:7001"
    ],
    primary3: [
      url: "redis://cluster:7002"
    ],
    primary4: [
      url: "redis://cluster:7003"
    ],
    primary5: [
      url: "redis://cluster:7004"
    ],
    primary6: [
      url: "redis://cluster:7005"
    ],
    #=> maybe more pools
  ]

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"
