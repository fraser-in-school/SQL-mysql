use card_dev;
create table card_right_item
(
    id              bigint(19) auto_increment comment '主键id'
        primary key,
    right_id        bigint(19)        null comment '权益id',
    item_id         bigint(19)        null comment '项目di',
    is_availability int(10) default 1 null comment '是否有效 是否有效：0、无效；1、有效；',
    version         int(10)           null comment '版本号',
    created_by_id   varchar(50)       null comment '创建人',
    created_by_name varchar(255)      null comment '创建人名称',
    created_time    datetime          null comment '创建时间',
    updated_by_id   bigint(19)        null comment '更新人',
    updated_by_name varchar(0)        null comment '更新人名称',
    updated_time    datetime          null comment '更新时间',
    platform        varchar(2)        null comment '平台 平台：1、拜博；2、养康'
)
    comment '权益和项目关联表 ' charset = utf8;

INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (1, null, 10, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (2, 3, 10, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (3, 4, 10, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (4, 5, 10, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (5, 1, 10, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (6, 2, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (7, 3, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (8, 4, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (9, 5, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (10, 6, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (11, 7, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (12, 8, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (13, 9, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (14, 10, 11, 1, null, null, null, null, null, null, null, '1');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (15, 30, 1, 1, null, 'dc3891fb229145bf9f82741807cce24a', 'wenquan03', '2020-07-17 19:11:11', null, null, null, 'BB');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (16, 34, 1, 1, null, 'dc3891fb229145bf9f82741807cce24a', 'wenquan03', '2020-07-20 10:08:23', null, null, null, 'BB');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (17, 35, 1, 1, null, 'dc3891fb229145bf9f82741807cce24a', 'wenquan03', '2020-07-20 11:09:56', null, null, null, 'BB');
INSERT INTO card_dev.card_right_item (id, right_id, item_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform) VALUES (18, 36, 2, 1, null, 'dc3891fb229145bf9f82741807cce24a', 'wenquan03', '2020-07-20 11:10:12', null, null, null, 'BB');