use card;
DROP TABLE IF EXISTS `stock_out_apply` CASCADE;
DROP TABLE IF EXISTS `stock_out_apply_audit` CASCADE;
DROP TABLE IF EXISTS `stock_out_apply_extends` CASCADE;
DROP TABLE IF EXISTS `stock_out_in_apply_relation` CASCADE;
DROP TABLE IF EXISTS `stock_out_apply_detail` CASCADE;



CREATE TABLE `stock_out_apply` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键' ,
  `apply_code` varchar(50) DEFAULT NULL COMMENT '出库申请单编号',
  `template_code` varchar(50) DEFAULT NULL COMMENT '出库卡模版',
  `stock_id` bigint DEFAULT NULL COMMENT '库存Id',
  `apply_number` int DEFAULT NULL COMMENT '出库数量',
  `receiver_name` varchar(50) DEFAULT NULL COMMENT '领取人',
  `receiver_phone` varchar(32) DEFAULT NULL COMMENT '领取人手机号',
  `out_style` varchar(2) DEFAULT NULL COMMENT '出库类型：1、领用；2、售卖；3、赠送',
  `oa_code` varchar(50) DEFAULT NULL COMMENT 'OA单号',
  `oa_approve_url` varchar(255) DEFAULT NULL COMMENT 'OA审批单链接',
  `remarks` varchar(512) DEFAULT NULL COMMENT '备注',
  `is_availability` int DEFAULT '1' COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(50) DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库申请表';

CREATE TABLE `stock_out_apply_audit` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` bigint DEFAULT NULL COMMENT '出库申请单id',
  `state` varchar(2) DEFAULT NULL COMMENT '状态：1、通过；2、不通过',
  `reason` varchar(255) DEFAULT NULL COMMENT '不通过原因',
  `is_availability` int DEFAULT '1' COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(50) DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库审核表';


CREATE TABLE `stock_out_apply_extends` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_code` varchar(50) DEFAULT NULL COMMENT '出库申请单编号,stock_out_apply.apply_code',
  `card_sell_org_code` varchar(50) DEFAULT NULL COMMENT '售卡主体Code',
  `card_sell_org_name` varchar(50) DEFAULT NULL COMMENT '售卡主体',
  `card_value` decimal(14,2) DEFAULT NULL COMMENT '总面值',
  `preferential_amount` decimal(14,2) DEFAULT NULL COMMENT '优惠金额',
  `real_amount` decimal(14,2) DEFAULT NULL COMMENT '实际金额',
  `pay_style` varchar(2) DEFAULT NULL COMMENT '支付方式：1、挂账；2、现金',
  `invoice` int DEFAULT '1' COMMENT '是否需要开票：1、是；0、否',
  `tax_amount` decimal(14,2) DEFAULT NULL COMMENT '税额',
  `tax_rate` decimal(4,4) DEFAULT NULL COMMENT '税率',
  `tax_exclude_amount` decimal(14,2) DEFAULT NULL COMMENT '不含税金额',
  `inner_close_account_org_code` varchar(50) DEFAULT NULL COMMENT '内部结算主体Code',
  `inner_close_account_org_name` varchar(50) DEFAULT NULL COMMENT '内部结算主体',
  `outer_close_account_org_name` varchar(255) DEFAULT NULL COMMENT '外结算主体',
  `close_account_time` datetime DEFAULT NULL COMMENT '结算日期',
  `into_account_time` datetime DEFAULT NULL COMMENT '到账日期',
  `commission_org_code` varchar(50) DEFAULT NULL COMMENT '佣金计提主体Code',
  `commission_org_name` varchar(50) DEFAULT NULL COMMENT '佣金计提主体',
  `commission_close_account_org_name` varchar(50) DEFAULT NULL COMMENT '佣金结算主体',
  `commission_amount` decimal(14,2) DEFAULT NULL COMMENT '佣金金额',
  `is_availability` int DEFAULT '1' COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(50) DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库申请表扩展表';



CREATE TABLE `stock_out_in_apply_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `out_apply_code` varchar(50) NOT NULL COMMENT '出库申请单编号，stock_out_apply.apply_code',
  `in_apply_code` varchar(50) NOT NULL COMMENT '入库申请编号，stock_in_apply.apply_code',
  `is_availability` int DEFAULT '1' COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(50) DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库申请单和入库申请单的关联表';

CREATE TABLE `stock_out_apply_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` bigint DEFAULT NULL COMMENT '出库申请单id',
  `card_id` bigint DEFAULT NULL COMMENT '外键，表card.id',
  `is_availability` int DEFAULT '1' COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `version` int DEFAULT NULL COMMENT '版本号',
  `created_by_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` varchar(50) DEFAULT NULL COMMENT '更新人',
  `updated_by_name` varchar(0) DEFAULT NULL COMMENT '更新人名称',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `platform` varchar(2) DEFAULT NULL COMMENT '平台 平台：1、拜博；2、养康',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库申请明细';