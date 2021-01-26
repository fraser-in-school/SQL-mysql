show engines;

-- innodb 的版本号
show variables like 'innodb_version';

-- innodb io 的 thread 数
show variables like 'innodb_%io_threads';

-- innodb 引擎的状态
show engine innodb status;

-- innodb 的 purge thread 的数量
show variables  like 'innodb_purge_threads';

-- 缓冲池的大小
show variables like 'innodb_buffer_pool_size';

-- 缓冲池的实例
show variables like 'innodb_buffer_pool_instances';

-- innodb 缓冲池的参数
select pool_id, pool_size, free_buffers, database_pages
    from information_schema.INNODB_BUFFER_POOL_STATS;

select POOL_ID, HIT_RATE, PAGES_MADE_YOUNG, PAGES_MADE_NOT_YOUNG_RATE
from information_schema.INNODB_BUFFER_POOL_STATS;

-- 查看 unzip_LRU 列表的页
select table_name, SPACE, PAGE_NUMBER, COMPRESSED_SIZE from information_schema.INNODB_BUFFER_PAGE_LRU
    where COMPRESSED_SIZE <> 0; -- <> 等价于 !=
-- 默认是未启用

-- 查看重做日志缓存的大小
show variables  like 'innodb_log_buffer_size';
-- 209715200

-- 查看脏页在缓冲池中的最大比例, 超过该值将触发 dirty page too much Checkpoint
show variables like 'innodb_max_dirty_pages_pct';
-- 默认 75%

-- 查看 change buffer 占用总内存的比例
show variables like 'innodb_change_buffer_max_size';
-- 默认 25%

