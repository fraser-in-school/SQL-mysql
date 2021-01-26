-- 【 发版准备工作 】

-- 1.数据库添加新字段
ALTER TABLE base_rights ADD office_id bigint(19) DEFAULT NULL COMMENT '事业部id 仅拜博有此字段';
ALTER TABLE base_rights ADD office_name varchar(60) DEFAULT NULL COMMENT '事业部名称 仅拜博有此字段';
ALTER TABLE base_rights ADD item_code_path varchar(2550) DEFAULT NULL COMMENT '项目路径';
alter table base_rights add rights_detail json default null comment '权益项目信息的json字符串';
alter table template add online_retailers_name varchar(255) default null comment '电商渠道的名字, 使用的外部结算主体的表';
alter table template add online_retailers_code varchar(255) default null comment '电商渠道code, 使用的外部结算主体的表';
alter table template add apply_nationwide tinyint(1) DEFAULT '0' COMMENT '是否全国可用的标志 1是 0否';
alter table template_rights add is_share tinyint(1) default 0 comment '模板的权益是否可以共享, 0: 不可以共享, 1: 可以共享';


-- 添加一个开发库
create database etoothcloud_dev;

alter table template modify online_retailers_id varchar(10000) default null comment '电商渠道的ID';
alter table template modify online_retailers_name varchar(25000) default null comment '电商渠道的ID';

drop table  if exists oa_user_new;
create table oa_user_new (
    `id` bigint(11) auto_increment not null comment '主键id',
    `user_cd` varchar(100) default null comment '用户中心的userCd',
    `login_name` varchar(100) default null comment '用户中心的OA账户',
    PRIMARY KEY (`id`) USING BTREE
);