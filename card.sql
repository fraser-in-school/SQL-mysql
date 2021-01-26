/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.0 		*/
/*  Created On : 30-7月-2020 16:38:24 				*/
/*  DBMS       : MySql 						*/
/* ---------------------------------------------------- */

SET FOREIGN_KEY_CHECKS=0
;
/* Drop Tables */

DROP TABLE IF EXISTS `card` CASCADE
;

/* Create Tables */

CREATE TABLE `card`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键id',
	`name` VARCHAR(255) NULL COMMENT '卡名称',
	`description` VARCHAR(255) NULL COMMENT '卡描述',
	`type` VARCHAR(2) NULL COMMENT '卡类型：1、满减卡；2、打折卡；3、直降卡；4、储值卡、5、项目卡；6、组合卡',
	`activation_period_type` INT NULL COMMENT '激活有效期类型:
		1-固定有效期，使用avtivation_start_time/activation_end_time;
		2-相对可用时间,领取后activation_period（时间长度）+activation_unit(单位）;
		3-不限',
	`activation_start_date` DATE NULL COMMENT '可激活起始时间，activation_period_type=1时启用',
	`activation_end_date` DATE NULL COMMENT '可激活结束时间，activation_period_type=1时启用',
	`activation_period` INT NULL COMMENT '领取后可以激活时间时长，activation_period_type=2时启用',
	`activation_unit` VARCHAR(1) NULL COMMENT 'activation_period_type=2时启用。1-年，2-月，3-日',
	`service_period_type` INT NULL COMMENT '1-固定可用时间；
		2-相对可用时间；
		3-不限',
	`service_start_date` DATE NULL COMMENT '使用有效期开始时间，service_period_type = 1 时启用',
	`service_end_date` DATE NULL COMMENT '使用有效期结束时间，service_period_type = 1 时启用',
	`service_period` INT NULL COMMENT '使用有效期时长，service_period_type = 2 时启用',
	`service_unit` INT NULL,
	`sale_price` INT NULL COMMENT '售价,单位分',
	`actual_active_expiration` DATE NULL COMMENT '实际的到期日期，相对于具体的卡，判断依据',
	`actual_use_expiration` DATE NULL COMMENT '实际使用到期日，判断依据',
	`state` VARCHAR(255) NOT NULL COMMENT '卡状态：1、已入库；2、已出库；3、客户已领取；4、已派发给用户；5、已激活；6、已使用；7、作废',
	`card_no` VARCHAR(0) NULL COMMENT '卡号',
	`password` VARCHAR(255) NULL COMMENT '卡密',
	`apply_org` VARCHAR(255) NOT NULL COMMENT '适用组织id，0、代表全部',
	`apply_org_name` VARCHAR(1000) NULL COMMENT '适用组织名字，多个以逗号分隔',
	`template_id` BIGINT NOT NULL COMMENT '模版id',
	`stock_id` BIGINT NULL COMMENT '库存id',
	`is_availability` INT NULL DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
	`version` INT NULL COMMENT '版本号',
	`created_by_id` VARCHAR(50) NULL COMMENT '创建人',
	`created_by_name` VARCHAR(255) NULL COMMENT '创建人名称',
	`created_time` DATETIME NULL COMMENT '创建时间',
	`updated_by_id` VARCHAR(50) NULL COMMENT '更新人',
	`updated_by_name` VARCHAR(0) NULL COMMENT '更新人名称',
	`updated_time` DATETIME NULL COMMENT '更新时间',
	`platform` VARCHAR(2) NULL COMMENT '平台 平台：1、拜博；2、养康',
	CONSTRAINT `PK_card` PRIMARY KEY (`id` ASC)
)
ENGINE=InnoDB
DEFAULT CHARSET utf8
COLLATE utf8_general_ci
COMMENT = '卡实体表，具体到某张卡 '

;

SET FOREIGN_KEY_CHECKS=1
;