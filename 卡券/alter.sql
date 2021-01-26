use card;
DROP TABLE IF EXISTS `card_rights`;
CREATE TABLE `card_rights`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `card_id` bigint(19) DEFAULT NULL COMMENT '卡id',
  `right_id` bigint(19) DEFAULT NULL COMMENT '卡权益id',
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组编码，组和组之间互斥',
  `total_number` int(11) DEFAULT NULL COMMENT '权益次数',
  `used_number` int(11) DEFAULT NULL COMMENT '使用过的次数',
  `is_availability` int(10) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(10) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡与权益关联表 ' ROW_FORMAT = Dynamic;


use card_dev;
alter table card_active modify `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id';
alter table card_active modify `updated_by_id`
    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人';
alter table card_active modify `created_by_id`
    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人';

alter table card.card_active modify `created_by_name`
    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称';
alter table card.card_active modify `updated_by_name`
    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称';

use card_dev;
DROP TABLE IF EXISTS `card_life_logs`;
CREATE TABLE `card_life_logs`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `card_id` bigint(19) DEFAULT NULL COMMENT '卡id',
  `current_state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '当前状态：1、已入库；2、已出库；3、客户已领取；4、已派发给用户；5、已激活；6、已使用；7、作废',
  `external_id` bigint(19) DEFAULT NULL COMMENT '外部对应单id，例如入库单，出库单',
  `external_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '外部对应的名字，如激活人名字，为生命周期服务',
  `is_availability` int(10) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(10) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡生命周期日志表，所有卡 ' ROW_FORMAT = Dynamic;


use card_dev;
DROP TABLE IF EXISTS `card_get`;
CREATE TABLE `card_get`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领取人手机号',
  `recipient_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领取人姓名',
  `number` int(10) DEFAULT NULL COMMENT '数量',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信openid',
  `wx_app_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信公众号appid',
  `mode` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方式：0、领取；1、发放，默认是0',
#   `card_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领取的卡id，多个逗号分隔',
  `card_id` bigint(19) DEFAULT NULL COMMENT '领取的卡id',
  `wx_active_code` varchar(50) DEFAULT NULL COMMENT '微信激活码',
  `channal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '渠道id',
  `external_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '外部订单号 外部订单号，例如商城调用接口传递订单号',
  `is_availability` int(10) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(10) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡领取记录表 ' ROW_FORMAT = Dynamic;


use card;
alter table card modify `card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '卡号';
alter table card modify `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '卡密';
alter table card_get modify `wx_active_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微信激活码';

use card;
DROP TABLE IF EXISTS `platform_permission`;
CREATE TABLE `platform_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  `ldap_name` varchar(255) COMMENT 'ldap账户',
  `name` varchar(255) COMMENT 'ldap账户',
  `is_availability` int(10) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(10) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存补充记录表 ' ROW_FORMAT = Dynamic;

-- 克隆测试数据库到开发数据库

create  database  card_dev;

alter table base_rights drop column item_code_path;

ALTER TABLE base_rights modify item_code_path varchar(4000) DEFAULT NULL COMMENT '权益路径';

alter table base_rights add rights_detail json default null comment '权益项目信息的json字符串';

ALTER TABLE base_rights ADD office_id bigint(19) DEFAULT NULL COMMENT '事业部id 仅拜博有此字段';
ALTER TABLE base_rights ADD office_name varchar(60) DEFAULT NULL COMMENT '事业部名称 仅拜博有此字段';

alter table template modify apply_nationwide tinyint(1) default 0 comment '是否全国可用的标志';

alter table template_rights add is_share tinyint(1) default 0 comment '模板的权益是否可以共享, 0: 不可以共享, 1: 可以共享';

alter table template add online_retailers_name varchar(255) default null comment '电商渠道的名字, 使用的外部结算主体的表';

alter table template add online_retailers_code varchar(255) default null comment '电商渠道code, 使用的外部结算主体的表';

--  mysqldump db1 -u card -pzqp6Jz30I083SGsl --add-drop-table | mysql card_dev -u card -pzqp6Jz30I083SGsl

-- 1116 提测
use card;

ALTER TABLE base_rights ADD office_id bigint(19) DEFAULT NULL COMMENT '事业部id 仅拜博有此字段';
ALTER TABLE base_rights ADD office_name varchar(60) DEFAULT NULL COMMENT '事业部名称 仅拜博有此字段';
ALTER TABLE base_rights ADD item_code_path varchar(2550) DEFAULT NULL COMMENT '项目路径';
alter table base_rights add rights_detail json default null comment '权益项目信息的json字符串';
alter table template add online_retailers_name varchar(255) default null comment '电商渠道的名字, 使用的外部结算主体的表';
alter table template add online_retailers_code varchar(255) default null comment '电商渠道code, 使用的外部结算主体的表';
alter table template add apply_nationwide tinyint(1) DEFAULT '0' COMMENT '是否全国可用的标志 1是 0否';
alter table template_rights add is_share tinyint(1) default 0 comment '模板的权益是否可以共享, 0: 不可以共享, 1: 可以共享';

--
delete from base_rights where platform = 'YK';
delete from card where platform = 'YK';
delete from card_active where platform = 'YK';
delete from card_get where platform = 'YK';
delete from card_life_logs where platform = 'YK';
delete from card_rights where platform = 'YK';
delete from card_scrap_apply where platform = 'YK';
delete from card_scrap_record where platform = 'YK';
delete from card_verification where platform = 'YK';
delete from stock where platform = 'YK';
delete from stock_in_apply where platform = 'YK';
delete from stock_in_apply_audit where platform = 'YK';
delete from stock_in_apply_detail where platform = 'YK';
delete from stock_in_auto_apply_audit where platform = 'YK';
delete from stock_out_apply where platform = 'YK';
delete from stock_out_apply_audit where platform = 'YK';
delete from stock_out_apply_detail where platform = 'YK';
delete from stock_out_apply_extends where platform = 'YK';
delete from stock_out_in_apply_relation where platform = 'YK';
delete from stock_replenish_records where platform = 'YK';
delete from template where platform = 'YK';
delete from template_rights where platform = 'YK';
delete from yk_rights_items where platform = 'YK';

--

--  ***********************  项目路径  *********************** --
-- base_rights 项目路径 SQL --
update base_rights br, (
    select br.id as id, replace(replace(concat('[', group_concat(concat('[', rbi.code, ']')), ']'), ',00', ''), '[]', '') as item_code_path
    from base_rights br
left join rights_bybo_items rbi on rbi.right_id = br.id
group by br.id
    ) tmp set br.item_code_path = tmp.item_code_path
where br.id = tmp.id and br.platform = 'BB';
-- End --

--  *************************  JSON字段 ********************** --
-- 先全部清为 null
update base_rights set rights_detail = null
    where id > 0;
-- End --
-- 设置 group_concat 函数的最大长度 单次会话有效
SET group_concat_max_len=102400;
-- End --
-- base_rights 权限信息的刷数据 SQL --
update base_rights br, (
-- 满减卡
select br.id as id, json_object('rightsDetail', min(desc_tmp.item_list), 'rightsDesc', min(desc_tmp.rights_desc)) as rights_detail
    from base_rights br
    left join (
        select id, code, concat('抵扣金额', round(quota / 100, 2), '元，', if(base = 0, '无门槛', concat('满', round(base / 100, 2), '元可用'))) as rights_desc, null as item_list
        from base_rights where rights_type = '1'
        union all
        select id, code, concat(round(quota / 100, 2), '%折扣，', if(base = 0, '无门槛，', concat('满', round(base / 100, 2), '元可用，')), if(has_top = 1, concat('折扣上限', round(top / 100, 2), '元'), '折扣无上限')) as rights_desc, null as item_list
        from base_rights where rights_type = '2'
        union all
        select id, code, concat('储值金额', round((base + quota) / 100, 2), '元（本金', round(base / 100, 2), '元，馈赠金', round(quota / 100, 2), '元）' ) as rights_desc, null as item_list
        from base_rights where rights_type = '3'
        union all
        (select br.id as id, min(br.code) as code, group_concat(rbi.name) as rights_desc,
                if(isnull(min(rbi.id)) = 1, null, json_arrayagg(json_object('itemId', rbi.id, 'itemCode', rbi.code, 'itemName', rbi.name, 'salePrice', rbi.sale_price))) as item_list
        from base_rights br
        inner join rights_bybo_items rbi on rbi.right_id = br.id
        where br.rights_type = '4' and br.platform = 'BB'
        group by br.id)
        union all
        (select br.id as id, min(br.code) as code, group_concat(yri.name) as rights_desc,
                if(isnull(min(yri.id)) = 1, null, json_arrayagg(json_object('itemId', yri.id, 'itemCode', yri.code, 'itemName', yri.name, 'salePrice', yri.sale_price))) as item_list
        from base_rights br
        inner join yk_rights_items yri on yri.right_id = br.id
        where br.rights_type = '4' and br.platform = 'YK'
        group by br.id)
        ) desc_tmp on br.id = desc_tmp.id
    group by br.id ) tmp set br.rights_detail = tmp.rights_detail
where br.id = tmp.id;
-- End --
-- ****************************************************** --


-- 克隆数据库
create database card_bk DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

-- 增加是否为岗位优惠卡
ALTER TABLE template ADD is_job_price tinyint(1) DEFAULT 0 COMMENT '是否岗位优惠卡 0否 1是';

-- mysql count 优化, card 表冗余两个字段, count 的时候只 count总表
alter table card
	add is_job_price tinyint(1) default 0 null;

alter table card
	add settlement_org_id int null;

-- 增加两个索引
create index idx_is_job_price
	on card (is_job_price);

create index idx_settlement_org_id
	on card (settlement_org_id);

-- 刷新 is_job_price 的字段
update card c set is_job_price = (select is_job_price from template t where c.template_id = t.id)
--  736983 rows affected in 37 s 705 ms

-- 刷新 settlement_org_id 的字段
update card c set settlement_org_id =
    (select settlement_org_id from stock_in_apply sia
        left join stock_in_apply_detail siad on sia.id = siad.apply_id
    where siad.card_id = c.id);
-- 736983 rows affected in 1 m 5 s 811 ms

-- 2021-01-06 需求变更, 核销统计增加四个查询字段, 两个查询条件
-- 在核销表上冗余出库类型的字段
alter table card_verification
    add out_style varchar(2) default null comment '出库类型：1市场活动领用（免费） 2对公售卖 3公关领用 4市场活动领用（售卖）';

-- 在核销表上冗余外部结算主体的字段
-- 并非所有出库的卡都有外部结算主体
alter table card_verification
    add out_close_account_org_id bigint(11) default null comment '外部结算主体的ID';

-- 在核销表上冗余付款方式
-- 不然查询核销的记录的付款方式需要多关联三张表
-- 跟外部结算主体是绑定的
alter table card_verification
    add pay_style varchar(2) default null comment '付款方式1: 渠道先付, 2: 渠道后付';


-- 增加 核销表从 platform 和 is_availability 的联合索引
create index idx_platform_is_availability
    on card_verification (platform, is_availability);

-- 增加一张 oa 账户和 userCd 的对应关系表
drop table  if exists oa_user;
create table oa_user (
    `id` bigint(11) auto_increment not null comment '主键id',
    `user_cd` varchar(100) default null comment '用户中心的userCd',
    `login_name` varchar(100) default null comment '用户中心的OA账户',
    PRIMARY KEY (`id`) USING BTREE
);

-- 在 platform_permission 表中冗余 userCd 字段,用来加快 userCd 的匹配速度
alter table platform_permission
    add `user_cd` varchar(100) default null comment '用户中心的ID';

-- 增加模板的事业部的字段
ALTER TABLE template ADD office_id bigint(19) DEFAULT NULL COMMENT '事业部id 仅拜博有此字段';
ALTER TABLE template ADD office_name varchar(60) DEFAULT NULL COMMENT '事业部名称 仅拜博有此字段';

