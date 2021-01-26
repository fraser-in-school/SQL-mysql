use card;
DROP TABLE IF EXISTS `card` CASCADE;

CREATE TABLE `card`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键id',
	# 卡描述信息
	`name` VARCHAR(255) NULL COMMENT '卡名称',
	`description` VARCHAR(255) NULL COMMENT '卡描述',
	`type` VARCHAR(2) NULL COMMENT '卡类型：
    1、满减卡；2、折扣卡；3、直降卡；4、储值卡、5、项目卡；6、组合卡',

	# 基础信息
	`platform` VARCHAR(2) NULL COMMENT '平台 平台：1、拜博；2、养康',
	`template_id` BIGINT NOT NULL COMMENT '模版id',
	`stock_id` BIGINT NULL COMMENT '库存id',
	`version` INT NULL COMMENT '版本号',

	`limitation` INT NULL COMMENT '领取或者发放限制数量',
	`sale_price` DECIMAL(10,2) NULL COMMENT '售价， 单位元',

	# 组织信息
	`apply_org` VARCHAR(255) NOT NULL COMMENT '适用组织id，0、代表全部',
    `apply_org_name` VARCHAR(1000) NULL COMMENT '适用组织名字，多个以逗号分隔',
    `ascription_org` BIGINT NULL COMMENT '归属组织id',
	`ascription_org_name` VARCHAR(255) NULL COMMENT '归属组织名称',

	# 出库时间和领取时间
	`delivery_time` DATE NULL COMMENT '出库时间',
	`receive_time` DATE NULL COMMENT '出库时初始化为出库时间，线上商城领取后更新时间，是判断是否在相对有效期内的关键字段',

	# 激活有效期
    `activation_period_type` INT NULL COMMENT '激活有效期类型:
	1-固定有效期，使用avtivation_start_time/activation_end_time;
	2-相对可用时间,领取后activation_period（时间长度）+activation_unit(单位）;
	3-不限',
	## 绝对时间
    `activation_start_date` DATE NULL COMMENT '可激活起始时间，activation_period_type=1时启用',
	`activation_end_date` DATE NULL COMMENT '可激活结束时间，activation_period_type=1时启用',
	##相对时间
	`activation_period` INT NULL COMMENT '领取后可以激活时间时长，activation_period_type=2时启用',
	`activation_unit` INT NULL COMMENT 'activation_period_type=2时启用。1-年，2-月，3-日',

	# 使用有效期
	`service_period_type` INT NULL COMMENT '1-固定可用时间；
	2-相对可用时间；
	3-不限',
	## 绝对时间
	`service_start_date` DATE NULL COMMENT '使用有效期开始时间，service_period_type = 1 时启用',
	`service_end_date` DATE NULL COMMENT '使用有效期结束时间，service_period_type = 1 时启用',
	## 相对时间
	`service_period` INT NULL COMMENT '使用有效期时长，service_period_type = 2 时启用',
	`service_unit` INT NULL COMMENT '使用有效期时长单位，1-年；2-月；3-日',

	# 使用信息
	`is_availability` INT NULL DEFAULT 1 COMMENT '是否有效 是否有效：0、无效；1、有效；',
	`use_max_num` INT NULL COMMENT '使用的最大次数，项目卡用一次算一次',
	`state` VARCHAR(255) NOT NULL COMMENT '卡状态：1、已入库；2、已出库；3、客户已领取；4、卡券已激活；
        5、部分核销；6、全部核销；7、已冻结；8、已退款；9、激活已过期；10、使用已过期；11、已报废',

    # 创建信息
	`created_by_id` VARCHAR(50) NULL COMMENT '创建人',
	`created_by_name` VARCHAR(255) NULL COMMENT '创建人名称',
	`created_time` DATETIME NULL COMMENT '创建时间',

	# 更新信息
	`updated_by_id` BIGINT NULL COMMENT '更新人',
	`updated_by_name` VARCHAR(0) NULL COMMENT '更新人名称',
	`updated_time` DATETIME NULL COMMENT '更新时间',

	# 卡号和密码
	`card_num` VARCHAR(0) NULL COMMENT '卡号',
	`card_password` VARCHAR(255) NULL COMMENT '卡密',

	CONSTRAINT `PK_card` PRIMARY KEY (`id` ASC)
)
ENGINE=InnoDB
DEFAULT CHARSET utf8
COLLATE utf8_general_ci
COMMENT = '卡实体表，具体到某张卡 '

;

