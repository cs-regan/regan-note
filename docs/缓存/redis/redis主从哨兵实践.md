## redis 主从哨兵

### 本次部署是单机伪集群，想要部署真正的集群，需要将秒个主件拆分到各个机器上去部署，只修改ip地址

以下demo在docker中实验、生产配置请自行修改

##### 当前实例为：1主2从3哨兵 （哨兵数量推荐为奇数）



#### 1.下载好redis镜像、本文使用redis4.0

创建data、conf目录，用来挂载配置和数据



#### 2.准备好容器配置

主master节点：redis.conf

```

bind 0.0.0.0

# 你可以配置salve实例是否接受写操作。可写的slave实例可能对存储临时数据比较有用(因为写入salve
# 的数据在同master同步之后将很容易被删除
slave-read-only yes

# 监听端口
port 16379
dir ./

```

slave1节点配置

```

bind 0.0.0.0

# 你可以配置salve实例是否接受写操作。可写的slave实例可能对存储临时数据比较有用(因为写入salve
# 的数据在同master同步之后将很容易被删除
slave-read-only yes

# 监听端口
port 16380

slaveof 172.30.0.1 16379
dir ./

```

slave2节点配置

```
bind 0.0.0.0

# 你可以配置salve实例是否接受写操作。可写的slave实例可能对存储临时数据比较有用(因为写入salve
# 的数据在同master同步之后将很容易被删除
slave-read-only yes

# 监听端口
port 16381

slaveof 172.30.0.1 16379
```



哨兵配置


1）monitor   指的是初始化的监控主切点，ip和端口，后面的数字2代表，必须2个sentinel才能判断主节点是否失败

2）down-after-milliseconds  指的是超过5000秒，且没有回复，则判定主节点不可达

3）failover-timeout  指的是故障转移时间

4）parallel-syncs  指的是故障转移到新的主节点时，从节点的复制节点数量

```
port 26379

dir "/data"

sentinel monitor mymaster 172.16.1.11 16379 3
sentinel down-after-milliseconds mymaster 5000  
sentinel failover-timeout mymaster 5000
sentinel parallel-syncs mymaster 1
```



#### 3.准备Docker-compose.yml

```yaml
version: '3'

services:
  master:
    image: 'redis:4.0'
    restart: always
    volumes:
      - ./conf/master/redis.conf:/usr/local/redis/redis.conf
      - ./conf/master/redis.log:/data/redis.log
      - ./data/master:/data
    networks:
      - backend
    command: redis-server /usr/local/redis/redis.conf
    ports:
      - "16379:16379"

  slave1:
    image: 'redis:4.0'
    restart: always
    volumes:
      - ./conf/slave1/redis.conf:/usr/local/redis/redis.conf
      - ./conf/slave1/redis.log:/data/redis.log
      - ./data/slave1:/data
    networks:
      - backend
    command: redis-server /usr/local/redis/redis.conf
    ports:
      - "16380:16380"

  slave2:
    image: 'redis:4.0'
    restart: always
    volumes:
      - ./conf/slave2/redis.conf:/usr/local/redis/redis.conf
      - ./conf/slave2/redis.log:/data/redis.log
      - ./data/slave2:/data
    networks:
      - backend
    command: redis-server /usr/local/redis/redis.conf
    ports:
      - "16381:16381"

  sentinel-1:
    image: 'redis:4.0'
    container_name: sentinel-1
    restart: always
    volumes:
      - ./conf/sentinel1/sentinel.conf:/etc/redis/sentinel.conf
      - ./data/sentinel1:/data
    networks:
      - backend
    command: redis-sentinel /etc/redis/sentinel.conf
    ports:
      - "26379:26379"

  sentinel-2:
    image: 'redis:4.0'
    container_name: sentinel-2
    restart: always
    volumes:
      - ./conf/sentinel2/sentinel.conf:/etc/redis/sentinel.conf
      - ./data/sentinel2:/data
    networks:
      - backend
    command: redis-sentinel /etc/redis/sentinel.conf
    ports:
      - "26380:26380"
  sentinel-3:
    image: 'redis:4.0'
    container_name: sentinel-3
    restart: always
    volumes:
      - ./conf/sentinel3/sentinel.conf:/etc/redis/sentinel.conf
      - ./data/sentinel3:/data
    networks:
      - backend
    command: redis-sentinel /etc/redis/sentinel.conf
    ports:
      - "26381:26381"
networks:
  backend:
```

#### 4.模拟master 宕机，检测哨兵工作

```
docker stop redis-cluster_master_1
```

##### 哨兵工作开始 

1.主节点宕机、哨兵投票主节点挂掉  3票通过 高于我们的2节点通过率odown master mymaster 10.231.41.45 16379 #quorum 3/2

2.选举新节点作为master

3.更新slave为master配置、并将其他slave指向新的master节点

4.哨兵切换配置switch-master mymaster

5.同步完成

```shell
sentinel-1 | 1:X 07 Sep 06:12:55.321 # +sdown master mymaster 10.231.41.45 16379

sentinel-2 | 1:X 07 Sep 06:12:55.352 # +sdown master mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:55.356 # +sdown master mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:55.409 # +odown master mymaster 10.231.41.45 16379 #quorum 3/2

sentinel-3 | 1:X 07 Sep 06:12:55.409 # +new-epoch 1

sentinel-3 | 1:X 07 Sep 06:12:55.409 # +try-failover master mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:55.417 # +vote-for-leader c200120919360041303cd82a1df1064c9964846b 1

sentinel-2 | 1:X 07 Sep 06:12:55.424 # +new-epoch 1

sentinel-1 | 1:X 07 Sep 06:12:55.426 # +new-epoch 1

sentinel-2 | 1:X 07 Sep 06:12:55.432 # +vote-for-leader c200120919360041303cd82a1df1064c9964846b 1

sentinel-2 | 1:X 07 Sep 06:12:55.432 # +odown master mymaster 10.231.41.45 16379 #quorum 2/2

sentinel-2 | 1:X 07 Sep 06:12:55.432 # Next failover delay: I will not start a failover before Tue Sep 7 06:13:15 2021

sentinel-3 | 1:X 07 Sep 06:12:55.433 # 88b866a7bf4a462a21ea8397bb8a2d3c6971bbb2 voted for c200120919360041303cd82a1df1064c9964846b 1

sentinel-1 | 1:X 07 Sep 06:12:55.435 # +vote-for-leader c200120919360041303cd82a1df1064c9964846b 1

sentinel-3 | 1:X 07 Sep 06:12:55.436 # e00c4d80c83c7815609dcb75e2c09dd4773da028 voted for c200120919360041303cd82a1df1064c9964846b 1

sentinel-3 | 1:X 07 Sep 06:12:55.471 # +elected-leader master mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:55.471 # +failover-state-select-slave master mymaster 10.231.41.45 16379

slave1_1 | 1:S 07 Sep 06:12:55.503 * Connecting to MASTER 10.231.41.45:16379

slave1_1 | 1:S 07 Sep 06:12:55.503 * MASTER <-> SLAVE sync started

slave1_1 | 1:S 07 Sep 06:12:55.504 # Error condition on socket for SYNC: Connection refused

sentinel-3 | 1:X 07 Sep 06:12:55.548 # +selected-slave slave 192.168.32.1:16380 192.168.32.1 16380 @ mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:55.549 * +failover-state-send-slaveof-noone slave 192.168.32.1:16380 192.168.32.1 16380 @ mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:55.651 * +failover-state-wait-promotion slave 192.168.32.1:16380 192.168.32.1 16380 @ mymaster 10.231.41.45 16379

slave1_1 | 1:M 07 Sep 06:12:55.653 # Setting secondary replication ID to ca395f31da4f5ee6a6df5b5e22b3c877dcc24237, valid up to offset: 2978. New replication ID is 1b025bff2d06b8f7bdacc22662ff7358a5d7c854

slave1_1 | 1:M 07 Sep 06:12:55.653 * Discarding previously cached master state.

slave1_1 | 1:M 07 Sep 06:12:55.653 * MASTER MODE enabled (user request from 'id=8 addr=192.168.32.1:35000 fd=11 name=sentinel-c2001209-cmd age=18 idle=0 flags=x db=0 sub=0 psub=0 multi=3 qbuf=0 qbuf-free=32768 obl=36 oll=0 omem=0 events=r cmd=exec')

slave1_1 | 1:M 07 Sep 06:12:55.664 # CONFIG REWRITE executed with success.

slave2_1 | 1:S 07 Sep 06:12:55.696 * Connecting to MASTER 10.231.41.45:16379

slave2_1 | 1:S 07 Sep 06:12:55.696 * MASTER <-> SLAVE sync started

slave2_1 | 1:S 07 Sep 06:12:55.697 # Error condition on socket for SYNC: Connection refused

sentinel-1 | 1:X 07 Sep 06:12:56.388 # +odown master mymaster 10.231.41.45 16379 #quorum 3/2

sentinel-1 | 1:X 07 Sep 06:12:56.389 # Next failover delay: I will not start a failover before Tue Sep 7 06:13:16 2021

sentinel-3 | 1:X 07 Sep 06:12:56.469 # +promoted-slave slave 192.168.32.1:16380 192.168.32.1 16380 @ mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:56.470 # +failover-state-reconf-slaves master mymaster 10.231.41.45 16379

slave2_1 | 1:S 07 Sep 06:12:56.527 * SLAVE OF 192.168.32.1:16380 enabled (user request from 'id=6 addr=192.168.32.1:51046 fd=9 name=sentinel-c2001209-cmd age=19 idle=0 flags=x db=0 sub=0 psub=0 multi=3 qbuf=140 qbuf-free=32628 obl=36 oll=0 omem=0 events=r cmd=exec')

sentinel-1 | 1:X 07 Sep 06:12:56.527 # +config-update-from sentinel c200120919360041303cd82a1df1064c9964846b 192.168.32.3 26381 @ mymaster 10.231.41.45 16379

sentinel-1 | 1:X 07 Sep 06:12:56.527 # +switch-master mymaster 10.231.41.45 16379 192.168.32.1 16380

sentinel-1 | 1:X 07 Sep 06:12:56.527 * +slave slave 192.168.32.1:16381 192.168.32.1 16381 @ mymaster 192.168.32.1 16380

sentinel-1 | 1:X 07 Sep 06:12:56.528 * +slave slave 192.168.16.1:16380 192.168.16.1 16380 @ mymaster 192.168.32.1 16380

sentinel-3 | 1:X 07 Sep 06:12:56.526 * +slave-reconf-sent slave 192.168.32.1:16381 192.168.32.1 16381 @ mymaster 10.231.41.45 16379

sentinel-2 | 1:X 07 Sep 06:12:56.527 # +config-update-from sentinel c200120919360041303cd82a1df1064c9964846b 192.168.32.3 26381 @ mymaster 10.231.41.45 16379

sentinel-2 | 1:X 07 Sep 06:12:56.527 # +switch-master mymaster 10.231.41.45 16379 192.168.32.1 16380

sentinel-2 | 1:X 07 Sep 06:12:56.529 * +slave slave 192.168.16.1:16380 192.168.16.1 16380 @ mymaster 192.168.32.1 16380

sentinel-2 | 1:X 07 Sep 06:12:56.529 * +slave slave 192.168.32.1:16381 192.168.32.1 16381 @ mymaster 192.168.32.1 16380

sentinel-2 | 1:X 07 Sep 06:12:56.529 * +slave slave 10.231.41.45:16379 10.231.41.45 16379 @ mymaster 192.168.32.1 16380

sentinel-1 | 1:X 07 Sep 06:12:56.529 * +slave slave 10.231.41.45:16379 10.231.41.45 16379 @ mymaster 192.168.32.1 16380

slave2_1 | 1:S 07 Sep 06:12:56.538 # CONFIG REWRITE executed with success.

slave2_1 | 1:S 07 Sep 06:12:56.708 * Connecting to MASTER 192.168.32.1:16380

slave2_1 | 1:S 07 Sep 06:12:56.709 * MASTER <-> SLAVE sync started

slave2_1 | 1:S 07 Sep 06:12:56.709 * Non blocking connect for SYNC fired the event.

slave2_1 | 1:S 07 Sep 06:12:56.711 * Master replied to PING, replication can continue...

slave2_1 | 1:S 07 Sep 06:12:56.713 * Trying a partial resynchronization (request ca395f31da4f5ee6a6df5b5e22b3c877dcc24237:2978).

slave1_1 | 1:M 07 Sep 06:12:56.714 * Slave 192.168.32.1:16381 asks for synchronization

slave1_1 | 1:M 07 Sep 06:12:56.714 * Partial resynchronization request from 192.168.32.1:16381 accepted. Sending 583 bytes of backlog starting from offset 2978.

slave2_1 | 1:S 07 Sep 06:12:56.716 * Successful partial resynchronization with master.

slave2_1 | 1:S 07 Sep 06:12:56.716 # Master replication ID changed to 1b025bff2d06b8f7bdacc22662ff7358a5d7c854

slave2_1 | 1:S 07 Sep 06:12:56.716 * MASTER <-> SLAVE sync: Master accepted a Partial Resynchronization.

sentinel-3 | 1:X 07 Sep 06:12:57.555 # -odown master mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:57.557 * +slave-reconf-inprog slave 192.168.32.1:16381 192.168.32.1 16381 @ mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:57.557 * +slave-reconf-done slave 192.168.32.1:16381 192.168.32.1 16381 @ mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:57.658 * +slave-reconf-sent slave 192.168.16.1:16380 192.168.16.1 16380 @ mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:57.658 # +failover-end master mymaster 10.231.41.45 16379

sentinel-3 | 1:X 07 Sep 06:12:57.659 # +switch-master mymaster 10.231.41.45 16379 192.168.32.1 16380

sentinel-3 | 1:X 07 Sep 06:12:57.660 * +slave slave 192.168.32.1:16381 192.168.32.1 16381 @ mymaster 192.168.32.1 16380

sentinel-3 | 1:X 07 Sep 06:12:57.660 * +slave slave 192.168.16.1:16380 192.168.16.1 16380 @ mymaster 192.168.32.1 16380

sentinel-3 | 1:X 07 Sep 06:12:57.660 * +slave slave 10.231.41.45:16379 10.231.41.45 16379 @ mymaster 192.168.32.1 16380

sentinel-1 | 1:X 07 Sep 06:12:59.585 # +sdown slave 10.231.41.45:16379 10.231.41.45 16379 @ mymaster 192.168.32.1 16380

sentinel-2 | 1:X 07 Sep 06:12:59.585 # +sdown slave 192.168.16.1:16380 192.168.16.1 16380 @ mymaster 192.168.32.1 16380

sentinel-2 | 1:X 07 Sep 06:12:59.587 # +sdown slave 10.231.41.45:16379 10.231.41.45 16379 @ mymaster 192.168.32.1 16380

sentinel-1 | 1:X 07 Sep 06:12:59.586 # +sdown slave 192.168.16.1:16380 192.168.16.1 16380 @ mymaster 192.168.32.1 16380

sentinel-3 | 1:X 07 Sep 06:13:00.681 # +sdown slave 192.168.16.1:16380 192.168.16.1 16380 @ mymaster 192.168.32.1 16380

sentinel-3 | 1:X 07 Sep 06:13:00.682 # +sdown slave 10.231.41.45:16379 10.231.41.45 16379 @ mymaster 192.168.32.1 16380
```



#### 至此哨兵工作流程已完成。 这里留一个疑问：由于哨兵切换会更新redis.conf主从配置信息、那么我们实际项目里配置的主从关系可能失效，程序中是否需要做监听并更新主从配置?
