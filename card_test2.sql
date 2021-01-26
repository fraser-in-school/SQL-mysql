/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : card

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 04/08/2020 10:59:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

create database card;
-- ----------------------------
-- Table structure for base_channel
-- ----------------------------
DROP TABLE IF EXISTS `base_channel`;
CREATE TABLE `base_channel`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '渠道码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '渠道名称',
  `remarks` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '渠道备注',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_item
-- ----------------------------
DROP TABLE IF EXISTS `base_item`;
CREATE TABLE `base_item`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目名称',
  `cost_price` int(10) DEFAULT NULL COMMENT '成本价，以分为单位',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_org
-- ----------------------------
DROP TABLE IF EXISTS `base_org`;
CREATE TABLE `base_org`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织名称',
  `org_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织地址',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织结构表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_rights
-- ----------------------------
DROP TABLE IF EXISTS `base_rights`;
CREATE TABLE `base_rights`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权益编码',
  `base` int(10) DEFAULT NULL COMMENT '门槛，和卡类型对应，满减卡：代表满多少。打折卡：代表超过多少以后开始打折，空代表任意金额。其他类型为空',
  `quota` int(10) DEFAULT NULL COMMENT '配额。例如满减（20），折扣（95），直降（10）',
  `top` int(11) DEFAULT NULL COMMENT '折扣卡的优惠上限，单位分',
  `rights_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权益类型：1、满减卡；2、打折卡；3、直降卡；4、储值卡、5、项目卡；6、组合卡',
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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权益表，只能增加记录，不能修改记录 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bybo_items
-- ----------------------------
DROP TABLE IF EXISTS `bybo_items`;
CREATE TABLE `bybo_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_class_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '大类编码',
  `main_class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '大类名称',
  `subclass_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '小类编码',
  `subclass_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '小类名称',
  `item_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '项目编码',
  `item_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '项目名称',
  `units` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单位',
  `is_availability` int(11) DEFAULT NULL COMMENT '0-无效，1-有效',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_time` datetime(0) DEFAULT NULL,
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_time` datetime(0) DEFAULT NULL,
  `platform` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '拜博处置项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '卡名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '卡描述',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '卡类型：1、满减卡；2、打折卡；3、直降卡；4、储值卡、5、项目卡；6、组合卡',
  `activation_period_type` int(11) DEFAULT NULL COMMENT '激活有效期类型:\r\n		1-固定有效期，使用avtivation_start_time/activation_end_time;\r\n		2-相对可用时间,领取后activation_period（时间长度）+activation_unit(单位）;\r\n		3-不限',
  `activation_start_date` date DEFAULT NULL COMMENT '可激活起始时间，activation_period_type=1时启用',
  `activation_end_date` date DEFAULT NULL COMMENT '可激活结束时间，activation_period_type=1时启用',
  `activation_period` int(11) DEFAULT NULL COMMENT '领取后可以激活时间时长，activation_period_type=2时启用',
  `activation_unit` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'activation_period_type=2时启用。1-年，2-月，3-日',
  `service_period_type` int(11) DEFAULT NULL COMMENT '1-固定可用时间；\r\n		2-相对可用时间；\r\n		3-不限',
  `service_start_date` date DEFAULT NULL COMMENT '使用有效期开始时间，service_period_type = 1 时启用',
  `service_end_date` date DEFAULT NULL COMMENT '使用有效期结束时间，service_period_type = 1 时启用',
  `service_period` int(11) DEFAULT NULL COMMENT '使用有效期时长，service_period_type = 2 时启用',
  `service_unit` int(11) DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL COMMENT '售价,单位分',
  `actual_active_expiration` date DEFAULT NULL COMMENT '实际的到期日期，相对于具体的卡，判断依据',
  `actual_use_expiration` date DEFAULT NULL COMMENT '实际使用到期日，判断依据',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡状态：1、已入库；2、已出库；3、客户已领取；4、已派发给用户；5、已激活；6、已使用；7、作废',
  `card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_cs DEFAULT NULL COMMENT '卡号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_cs DEFAULT NULL COMMENT '卡密',
  `apply_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适用组织id，0、代表全部',
  `apply_org_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '适用组织名字，多个以逗号分隔',
  `template_id` bigint(20) NOT NULL COMMENT '模版id',
  `stock_id` bigint(20) DEFAULT NULL COMMENT '库存id',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡实体表，具体到某张卡 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card_active
-- ----------------------------
DROP TABLE IF EXISTS `card_active`;
CREATE TABLE `card_active`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '卡券的激活记录表',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '激活人手机号',
  `card_id` bigint(19) DEFAULT NULL COMMENT '卡id',
  `insurance_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '保单号',
  `channal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '渠道id',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡激活记录表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card_apply_office
-- ----------------------------
DROP TABLE IF EXISTS `card_apply_office`;
CREATE TABLE `card_apply_office`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `office` bigint(255) DEFAULT NULL COMMENT '门店id',
  `office_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '门店名称',
  `office_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '门店地址',
  `template_id` bigint(11) DEFAULT NULL COMMENT '模版id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡适用门店' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card_apply_org
-- ----------------------------
DROP TABLE IF EXISTS `card_apply_org`;
CREATE TABLE `card_apply_org`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org` bigint(19) DEFAULT NULL COMMENT '组织id',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织名称',
  `org_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织地址',
  `template_id` bigint(19) DEFAULT NULL COMMENT '模版id',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡适用组织 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card_get
-- ----------------------------
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

-- ----------------------------
-- Table structure for card_life_logs
-- ----------------------------
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

-- ----------------------------
-- Table structure for card_right_item
-- ----------------------------
-- ----------------------------
-- use card_dev;
DROP TABLE IF EXISTS `card_right_item`;
CREATE TABLE `card_right_item`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `right_id` bigint(19) DEFAULT NULL COMMENT '权益id',
  `item_id` bigint(19) DEFAULT NULL COMMENT '项目di',
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权益和项目关联表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card_rights
-- ----------------------------
DROP TABLE IF EXISTS `card_rights`;
CREATE TABLE `card_rights`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `card_id` bigint(19) DEFAULT NULL COMMENT '卡id',
  `rights_id` bigint(19) DEFAULT NULL COMMENT '卡权益id',
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

-- ----------------------------
-- Table structure for card_use_detail
-- ----------------------------
DROP TABLE IF EXISTS `card_use_detail`;
CREATE TABLE `card_use_detail`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rights_id` bigint(19) DEFAULT NULL COMMENT '权益id',
  `item` bigint(19) DEFAULT NULL COMMENT '项目id',
  `times` int(10) DEFAULT NULL COMMENT '使用次数',
  `card_used_id` bigint(19) DEFAULT NULL COMMENT '使用记录id',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '使用详情表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card_used
-- ----------------------------
DROP TABLE IF EXISTS `card_used`;
CREATE TABLE `card_used`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '卡的使用记录表',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用人手机号',
  `card_id` bigint(19) DEFAULT NULL COMMENT '卡id',
  `external_order_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '外部跟踪号 其他系统传递过来的外部跟踪号',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `channal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用渠道',
  `used_org` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用的组织',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡使用记录表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ldaptooffice
-- ----------------------------
DROP TABLE IF EXISTS `ldaptooffice`;
CREATE TABLE `ldaptooffice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `officeid` int(11) DEFAULT NULL,
  `tenantid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `officename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ldapnum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` bigint(20) DEFAULT NULL,
  `recordcreatedtime` datetime(0) NOT NULL,
  `recordcreateduser` int(11) NOT NULL,
  `recordupdatedtime` datetime(0) DEFAULT NULL,
  `recordupdateduser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phonenumber` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `district` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contactname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contactphonenumber` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tenantid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `recordcreatedtime` datetime(0) NOT NULL,
  `recordcreateduser` int(11) NOT NULL,
  `recordupdatedtime` datetime(0) DEFAULT NULL,
  `recordupdateduser` int(11) DEFAULT NULL,
  `worktime` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `officepicurl` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `officeshowpicurl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `officespecial` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `officeintroduction` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `longitude` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `latitude` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cityid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deleteflag` smallint(6) DEFAULT NULL,
  `platform` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `officeid` int(11) DEFAULT NULL,
  `domainid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hideflag` smallint(6) DEFAULT NULL,
  `officetype` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `Path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `onlinecustomerurl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `qrcodeurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isqrcodeshow` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for right_item
-- ----------------------------
DROP TABLE IF EXISTS `right_item`;
CREATE TABLE `right_item`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `right_id` bigint(19) DEFAULT NULL COMMENT '权益id',
  `item_id` bigint(19) DEFAULT NULL COMMENT '项目di',
  `item_num` int(11) DEFAULT NULL COMMENT '项目次数',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权益和项目关联表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rights_bybo_items
-- ----------------------------
DROP TABLE IF EXISTS `rights_bybo_items`;
CREATE TABLE `rights_bybo_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `right_id` bigint(20) NOT NULL COMMENT '权益ID',
  `item_id` bigint(20) NOT NULL COMMENT '拜博项目ID',
  `sale_price` int(11) DEFAULT NULL COMMENT '售价',
  `is_availability` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_time` datetime(0) DEFAULT NULL,
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platform` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权益-拜博项目关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `template_id` bigint(19) DEFAULT NULL COMMENT '卡模版id',
  `stock_total` int(10) DEFAULT NULL COMMENT '累积库存',
#   `auto_fill_percent` int(10) DEFAULT NULL COMMENT '到百分多少时增加库存，只有是自动类型时有此字段',
  `init_stock_number` int(11) DEFAULT NULL COMMENT '初始库存容量，只有是自动入库的时候才填写此字段',
  `threshold` int(11) DEFAULT NULL COMMENT '需要自动添加库存的阈值，只有是自动入库的时候才填写此字段',
  `increase_number` int(11) DEFAULT NULL COMMENT '自动添加库存的数量，只有是自动入库的时候才填写此字段',
  `stock_mode` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '库存类型：1、手动申请；2、自动补库存 ；，一旦创建不允许修改',
  `stock_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '库存编码',
  `stock_available_number` int(10) DEFAULT NULL COMMENT '可用库存',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '库存名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述，说明',
  `office_id` bigint(19) DEFAULT NULL COMMENT '事业部或者是门店id',
  `stock_capacity` int(10) DEFAULT NULL COMMENT '库存容量，只有是自动类型的库存才有此字段',
  `stock_locked` int(11) DEFAULT NULL COMMENT '冻结库存',
  `stock_out` int(11) DEFAULT NULL COMMENT '已出库数量',
  `is_enable` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否启动：0、未启用（可以与申请单联动）；1、启用；2、停用；',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_channal
-- ----------------------------
DROP TABLE IF EXISTS `stock_channal`;
CREATE TABLE `stock_channal`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `channal_id` bigint(19) DEFAULT NULL COMMENT '渠道码',
  `channal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '驱动名称',
  `stock_id` bigint(19) DEFAULT NULL COMMENT '库存id',
  `stock_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '库存名字',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道库存对应表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_in_apply
-- ----------------------------
DROP TABLE IF EXISTS `stock_in_apply`;
CREATE TABLE `stock_in_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '入库申请表',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模版id',
  `apply_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '申请编号，增加到卡号里面，区分不同卡',
  `stock_id` bigint(20) DEFAULT NULL COMMENT '库存id',
  `apply_number` int(11) DEFAULT NULL COMMENT '申请数量，只有选定是手动补库存的仓库时才需要填写此字段',
  `init_stock_number` int(11) DEFAULT NULL COMMENT '初始库存容量，只有是自动入库的时候才填写此字段',
  `threshold` int(11) DEFAULT NULL COMMENT '需要自动添加库存的阈值，只有是自动入库的时候才填写此字段',
  `increase_number` int(11) DEFAULT NULL COMMENT '自动添加库存的数量，只有是自动入库的时候才填写此字段',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '入库类型：1、手动创建；2、系统自动添加',
  `state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态：1、已提交；2、审核通过；3、审核不通过',
  `in_stock_org` bigint(20) DEFAULT NULL COMMENT '入库组织',
  `settlement_org_id` bigint(20) DEFAULT NULL COMMENT '结算机构ID',
  `settlement_org_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结算机构',
  `oa_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'oa单号',
  `oa_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'oa审批单链接',
  `is_ecard` int(11) DEFAULT NULL COMMENT '是否电子卡，0-否，1-是',
  `print_date` date DEFAULT NULL COMMENT '印刷时间，实体卡需填写',
  `remarks` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  `emp_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人工号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库申请表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_in_apply_audit
-- ----------------------------
DROP TABLE IF EXISTS `stock_in_apply_audit`;
CREATE TABLE `stock_in_apply_audit`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` bigint(19) DEFAULT NULL COMMENT '入库申请单id',
  `state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态：1、通过；2、不通过',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不通过原因',
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库审核表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_in_apply_detail
-- ----------------------------
DROP TABLE IF EXISTS `stock_in_apply_detail`;
CREATE TABLE `stock_in_apply_detail`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` bigint(19) DEFAULT NULL COMMENT '入库申请单id',
  `card_id` bigint(19) DEFAULT NULL COMMENT '状态：1、通过；2、不通过',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库申请明细 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_out_apply
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_apply`;
CREATE TABLE `stock_out_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出库申请单编号',
  `template_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出库卡模版',
  `stock_id` bigint(20) DEFAULT NULL COMMENT '库存Id',
  `apply_number` int(11) DEFAULT NULL COMMENT '出库数量',
  `receiver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领取人',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领取人手机号',
  `out_style` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出库类型：1、领用；2、售卖；3、赠送',
  `oa_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'OA单号',
  `oa_approve_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'OA审批单链接',
  `remarks` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_out_apply_audit
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_apply_audit`;
CREATE TABLE `stock_out_apply_audit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '出库申请单id',
  `state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态：1、通过；2、不通过',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不通过原因',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_out_apply_detail
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_apply_detail`;
CREATE TABLE `stock_out_apply_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '出库申请单id',
  `card_id` bigint(20) DEFAULT NULL COMMENT '外键，表card.id',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库申请明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_out_apply_extends
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_apply_extends`;
CREATE TABLE `stock_out_apply_extends`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出库申请单编号,stock_out_apply.apply_code',
  `card_sell_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '售卡主体Code',
  `card_sell_org_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '售卡主体',
  `card_value` decimal(14, 2) DEFAULT NULL COMMENT '总面值',
  `preferential_amount` decimal(14, 2) DEFAULT NULL COMMENT '优惠金额',
  `real_amount` decimal(14, 2) DEFAULT NULL COMMENT '实际金额',
  `pay_style` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付方式：1、挂账；2、现金',
  `invoice` int(11) DEFAULT 1 COMMENT '是否需要开票：1、是；0、否',
  `tax_amount` decimal(14, 2) DEFAULT NULL COMMENT '税额',
  `tax_rate` decimal(4, 4) DEFAULT NULL COMMENT '税率',
  `tax_exclude_amount` decimal(14, 2) DEFAULT NULL COMMENT '不含税金额',
  `inner_close_account_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内部结算主体Code',
  `inner_close_account_org_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内部结算主体',
  `outer_close_account_org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '外结算主体',
  `close_account_time` datetime(0) DEFAULT NULL COMMENT '结算日期',
  `into_account_time` datetime(0) DEFAULT NULL COMMENT '到账日期',
  `commission_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '佣金计提主体Code',
  `commission_org_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '佣金计提主体',
  `commission_close_account_org_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '佣金结算主体',
  `commission_amount` decimal(14, 2) DEFAULT NULL COMMENT '佣金金额',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库申请表扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_out_in_apply_relation
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_in_apply_relation`;
CREATE TABLE `stock_out_in_apply_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `out_apply_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出库申请单编号，stock_out_apply.apply_code',
  `in_apply_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入库申请编号，stock_in_apply.apply_code',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库申请单和入库申请单的关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作业务名',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `table_id` bigint(19) DEFAULT NULL COMMENT '操作表id',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作类型,(添加ADD,删除DELETE,修改UPDATE)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_operation_log_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log_detail`;
CREATE TABLE `sys_operation_log_detail`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `operation_log_id` bigint(19) DEFAULT NULL COMMENT '操作业务名',
  `clm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段名',
  `clm_comment` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段描述',
  `old_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '旧值',
  `new_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '新值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志详情表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_offices
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_offices`;
CREATE TABLE `sys_user_offices`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `oa_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'oa用户名',
  `manage_org` bigint(19) DEFAULT NULL COMMENT '管理的组织id',
  `manage_org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理的组织名字',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理的组织对应关系，应用于数据权限 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for template
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '卡名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '卡描述',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '卡类型：1、满减卡；2、打折卡；3、直降卡；4、储值卡、5、项目卡；6、组合卡',
  `limitation` int(11) DEFAULT NULL COMMENT '领取或者发放限制数量',
  `sale_price` int(11) DEFAULT NULL COMMENT '售价,单位分',
  `apply_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适用组织id，0、代表全部',
  `apply_org_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '适用组织名字，多个以逗号分隔',
  `ascription_org` bigint(20) DEFAULT NULL COMMENT '归属组织id',
  `ascription_org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '归属组织名称',
  `activation_period_type` int(11) DEFAULT NULL COMMENT '激活有效期类型:\r\n	1-固定有效期，使用avtivation_start_time/activation_end_time;\r\n	2-相对可用时间,领取后activation_period（时间长度）+activation_unit(单位）;\r\n	3-不限',
  `activation_start_date` date DEFAULT NULL COMMENT '可激活起始时间，activation_period_type=1时启用',
  `activation_end_date` date DEFAULT NULL COMMENT '可激活结束时间，activation_period_type=1时启用',
  `activation_period` int(11) DEFAULT NULL COMMENT '领取后可以激活时间时长，activation_period_type=2时启用',
  `activation_unit` int(11) DEFAULT NULL COMMENT 'activation_period_type=2时启用。1-年，2-月，3-日',
  `service_start_date` date DEFAULT NULL COMMENT '使用有效期开始时间，service_period_type = 1 时启用',
  `service_end_date` date DEFAULT NULL COMMENT '使用有效期结束时间，service_period_type = 1 时启用',
  `service_period_type` int(11) DEFAULT NULL COMMENT '1-固定可用时间；\r\n	2-相对可用时间；\r\n	3-不限',
  `service_period` int(11) DEFAULT NULL COMMENT '使用有效期时长，service_period_type = 2 时启用',
  `service_unit` int(11) DEFAULT NULL COMMENT '使用有效期时长单位，1-年；2-月；3-日',
  `is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡模版表，定义卡属性和规则 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for template_apply_org
-- ----------------------------
DROP TABLE IF EXISTS `template_apply_org`;
CREATE TABLE `template_apply_org`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org` bigint(19) DEFAULT NULL COMMENT '组织id',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织名称',
  `org_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织地址',
  `template_id` bigint(19) DEFAULT NULL COMMENT '模版id',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模版适用组织 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for template_rights
-- ----------------------------
DROP TABLE IF EXISTS `template_rights`;
CREATE TABLE `template_rights`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `template_id` bigint(19) DEFAULT NULL COMMENT '卡模版id',
  `right_id` bigint(19) DEFAULT NULL COMMENT '卡权益id',
  `total_number` int(11) DEFAULT NULL COMMENT '权益次数',
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组编码，组和组之间互斥',
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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡模版和权益对应表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_replenish_records
-- ----------------------------
DROP TABLE IF EXISTS `stock_replenish_records`;
CREATE TABLE `stock_replenish_records` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`template_id` bigint(20) DEFAULT NULL COMMENT '模版id',
`before_replenish_number` bigint(11) DEFAULT NULL COMMENT '补充库存之前的数量',
`after_replenish_number` bigint(11) DEFAULT NULL COMMENT '补充库存之后的数量',
`stock_id` bigint(11) DEFAULT  NULL COMMENT '库存的 ID',
`is_availability` int(11) DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
`version` int(11) DEFAULT NULL COMMENT '版本号',
`created_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
`created_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
`created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
`updated_by_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
`updated_by_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
`updated_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
`platform` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
`emp_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人工号',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存补充记录表 ' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `card_verification`;
CREATE TABLE `card_verification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `right_id` bigint(20) NOT NULL COMMENT '权益 id',
  `card_id` bigint(20) NOT NULL COMMENT '卡券 id',
  `verification_org_name` varchar(255) COMMENT '消费门店',
  `original_price` bigint(11) COMMENT '原价',
  `settlement_price` bigint(11) COMMENT '结算价格',
  `verification_name` varchar(50) COMMENT '核销人',
  `phone` varchar(255) COMMENT '电话号码',
  `uid` varchar(50) COMMENT '标识ID，用于标识是否是同一次核销的',
  `used_time` bigint(11) COMMENT '该权益此次核销的使用次数',
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存补充记录表 ' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `card_verification`;
CREATE TABLE `card_verification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `right_id` bigint(20) NOT NULL COMMENT '权益 id',
  `card_id` bigint(20) NOT NULL COMMENT '卡券 id',
  `verification_org_name` varchar(255) COMMENT '消费门店',
  `original_price` bigint(11) COMMENT '原价',
  `settlement_price` bigint(11) COMMENT '结算价格',
  `verification_name` varchar(50) COMMENT '核销人',
  `phone` varchar(255) COMMENT '电话号码',
  `uid` varchar(50) COMMENT '标识ID，用于标识是否是同一次核销的',
  `used_time` bigint(11) COMMENT '该权益此次核销的使用次数',
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存补充记录表 ' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
