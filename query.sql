SELECT COUNT(1) FROM ( SELECT  id,name,description,type,activation_period_type,activation_start_date,activation_end_date,activation_period,activation_unit,service_period_type,service_start_date,service_end_date,service_period,service_unit,sale_price,actual_active_expiration,actual_use_expiration,state,card_no,password,apply_org,apply_org_name,template_id,stock_id,is_availability,version,created_by_id,created_by_name,created_time,updated_by_id,updated_by_name,updated_time,platform  FROM card

 WHERE type IN ('0') ORDER BY updated_time DESC );

select template_id from card where card_no = 'TKZJ0079';

delete from template where id = 456;

select * from template where id = 456 and platform = null;

select * from stock_in_apply where template_id = 456  and type = '2';

 select srr.*, t.code as template_code, t.name as template_name, t.type as template_type, t.apply_org_name as apply_org_name, s.stock_available_number as stock_available_number from stock_replenish_records srr left join template t on srr.template_id = t.id left join stock s on srr.stock_id=s.id;

select srr.*, t.code as template_code, t.name as template_name, t.type as template_type, t.apply_org_name as apply_org_name,s.stock_available_number as stock_available from stock_replenish_records srr left join template t on srr.template_id = t.id left join stock s on srr.stock_id=s.id;

select srr.*, t.code as template_code, t.name as template_name,
       t.type as template_type, t.apply_org_name as apply_org_name, s.stock_available_number as stock_available
    from stock_replenish_records srr left join template t on srr.template_id = t.id
        left join stock s on srr.stock_id=s.id LIMIT 0,10;


select base_item.name from card_right_item left join base_item on base_item.id = card_right_item.item_id where card_right_item.right_id = 1;


select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id, t.name as templateName, sia.is_ecard as is_ecard from card c
    left join template t on c.template_id = t.id
    left join stock_in_apply_detail siad on c.id = siad.card_id
    left join stock_in_apply sia on siad.apply_id = sia.id
    LIMIT 0, 10;

select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id,
       t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_name as settlement_org_name
    from card c
        left join template t on c.template_id = t.id
        left join stock_in_apply_detail siad on c.id = siad.card_id
        left join stock_in_apply sia on siad.apply_id = sia.id LIMIT 0,5;


alter table rights_bybo_items modify sale_price int(11);

use card;
use card_dev;
alter table card_life_logs add external_name varchar(255);
DROP TABLE IF EXISTS `card_rights`;
CREATE TABLE `card_rights`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `card_id` bigint(19) DEFAULT NULL COMMENT '卡id',
  `right_id` bigint(19) DEFAULT NULL COMMENT '卡权益id',
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组编码，组和组之间互斥',
  `total_number` int(11) DEFAULT NULL COMMENT '权益次数',
  `used_number` int(11) DEFAULT NULL COMMENT '使用过的次数',
  `balance` int(11) DEFAULT NULL COMMENT '储值卡的余额',
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


use card_dev;
DROP TABLE IF EXISTS `stock_in_auto_apply_audit`;
CREATE TABLE `stock_in_auto_apply_audit`  (
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

use card_dev;
select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id,
       t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_name as settlement_org_name from card c
        left join template t on c.template_id = t.id
        left join stock_in_apply_detail siad on c.id = siad.card_id
    left join stock_in_apply sia on siad.apply_id = sia.id;

SELECT COUNT(1) FROM card c LEFT JOIN template t ON c.template_id = t.id LEFT JOIN stock_in_apply_detail siad ON c.id = siad.card_id LEFT JOIN stock_in_apply sia ON siad.apply_id = sia.id

select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id,
       t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_name as settlement_org_name from card c
        left join template t on c.template_id = t.id
        inner join stock_in_apply_detail siad on c.id = siad.card_id
        left join stock_in_apply sia on siad.apply_id = sia.id
        ORDER BY c.id DESC LIMIT 1,10;



select c.id, c.template_id, t.name
        from card c
         left join template t on c.template_id = t.id
        ;

select c.* from card c
left join template t on c.template_id = t.id
order by c.id desc ;

select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id, t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_name as settlement_org_name from card c left join template t on c.template_id = t.id left join stock_in_apply_detail siad on c.id = siad.card_id left join stock_in_apply sia on siad.apply_id = sia.id LIMIT 0,10;


use card;
select sum(state = '1') as wait_for_audit,
       sum(state = '2') as audit_passed,
       sum(state = '3') as audit_refused
       from stock_in_auto_apply_audit;

select sum(settlement_price) from card_verification where card_id = 2;

select id from template where DATE_FORMAT(created_time,'%Y-%m-%d') = '2020-08-27';


select sum(base + quota) as total_amount from base_rights where id = 176;

select sia.*,t.code as template_code, t.name as template_name,t.type as template_type,
       siaa.updated_time as audit_time, siaa.updated_by_name as audit_by_name,
       siaa.reason as reason from stock_in_apply sia
           left join template t on sia.template_id = t.id
           left join stock_in_apply_audit siaa on siaa.apply_id=sia.id
WHERE sia.platform = 'BB' AND sia.state = '1' AND sia.type = '2' ORDER BY sia.created_time DESC LIMIT 0,15;

select sia.*,t.code as template_code, t.name as template_name,t.type as template_type,
       siaa.updated_time as audit_time, siaa.updated_by_name as audit_by_name,
       siaa.reason as reason from stock_in_apply sia
           left join template t on sia.template_id = t.id
           left join stock_in_apply_audit siaa on siaa.apply_id=sia.id
WHERE sia.platform = 'BB' AND sia.state = '2' AND sia.state = '1' AND sia.type = '2' ORDER BY sia.created_time DESC;

select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id, t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_name as settlement_org_name from card c left join template t on c.template_id = t.id inner join stock_in_apply_detail siad on c.id = siad.card_id left join stock_in_apply sia on siad.apply_id = sia.id WHERE c.platform = 'BB' ORDER BY created_time DESC;

select c.id as card_id, c.*, t.id as template_id, t.apply_org_name as apply_org_name, sia.settlement_org_name as settlement_org_name from card c left join template t on c.template_id = t.id inner join stock_in_apply_detail siad on c.id = siad.card_id left join stock_in_apply sia on siad.apply_id = sia.id;

select c.id as card_id, c.*, t.id as template_id, t.apply_org_name as apply_org_name,
       sia.settlement_org_name as settlement_org_name from card c
           left join template t on c.template_id = t.id
           inner join stock_in_apply_detail siad on c.id = siad.card_id
           left join stock_in_apply sia on siad.apply_id = sia.id WHERE c.id = 33693;


select card_id, wx_active_code from card_get;

select id, card_no from card where id > 30000;

use card;
select * from card where activation_period_type = '2';
                             && activation_unit = null;

select cv.*, c.id as card_id, c.name as template_name, c.type as type,
       c.card_no as card_no,sia.settlement_org_name as settlement_org_name
from card_verification cv
    inner join card  c on c.id = cv.card_id
    left join stock_in_apply sia  on sia.stock_id = c.stock_id;


use card;
select c.id as card_id, c.*, t.id as template_id, c.name as card_name, c.type as cardType, c.description as cardDesc,
       c.apply_org_name as apply_org_name, c.apply_org as apply_org, sia.settlement_org_name as settlement_org_name from card c
        inner join template t on c.template_id = t.id
        inner join stock_in_apply_detail siad on c.id = siad.card_id
        left join stock_in_apply sia on siad.apply_id = sia.id;

select cv.*, c.id as card_id, c.name as card_name, c.type as card_type, c.card_no as card_no,
       t.id as templateId, t.code as templateCode, sia.settlement_org_name as settlement_org_name,
       sia.settlement_org_id as settlement_org_id
from card_verification cv
           left join card c on c.id = cv.card_id
           left join template t on c.template_id = t.id
           left join stock_in_apply sia on sia.stock_id = c.stock_id
WHERE DATE_FORMAT(cv.created_time,'%Y.%m.%d') = '2020.09.04';

SELECT * FROM community WHERE instr(concat(',', '38,39,40,41', ','), concat(',', id, ',')) > 0;
SELECT * FROM community WHERE instr(concat(',', ?, ','), concat(',', id, ',')) > 0;

select cv.*, c.id as card_id, c.name as card_name, c.type as card_type, c.card_no as card_no,t.id as templateId, t.code as templateCode, sia.settlement_org_name as settlement_org_name, sia.settlement_org_id as settlement_org_id from card_verification cv left join card c on c.id = cv.card_id left join template t on c.template_id = t.id left join stock_in_apply sia on sia.stock_id = c.stock_id WHERE DATE_FORMAT(cv.created_time,'%Y-%m-%d') = '2020-09-21' ORDER BY cv.created_time DESC;

SELECT COUNT(1) FROM card_verification cv LEFT JOIN card c ON c.id = cv.card_id LEFT JOIN template t ON c.template_id = t.id LEFT JOIN stock_in_apply sia ON sia.stock_id = c.stock_id WHERE cv.verification_name LIKE '%王嘉核销1%' AND DATE_FORMAT(cv.created_time, '%Y-%m-%d') = '2020-09-21';

select cv.*, c.id as card_id, c.name as card_name, c.type as card_type, c.card_no as card_no ,t.id as templateId, t.code as templateCode, sia.settlement_org_name as settlement_org_name, sia.settlement_org_id as settlement_org_id
from card_verification cv
    left join card c on c.id = cv.card_id
    left join template t on c.template_id = t.id
    left join stock_in_apply sia on sia.id = (select apply_id from stock_in_apply_detail siad where siad.card_id = cv.card_id)
WHERE cv.verification_name LIKE '%王嘉核销1%' AND DATE_FORMAT(cv.created_time,'%Y-%m-%d') = '2020-09-21'
ORDER BY cv.created_time DESC;

select sia.id, c.id as card_id, c.name as card_name, c.type as card_type, c.card_no as card_no,
       t.id as templateId, t.code as templateCode,
       sia.settlement_org_name as settlement_org_name, sia.settlement_org_id as settlement_org_id
from card_verification cv
    left join card c on c.id = cv.card_id
    left join template t on c.template_id = t.id
    left join stock_in_apply sia on sia.id =
                                    (select apply_id from stock_in_apply_detail siad where siad.card_id = cv.card_id)
WHERE c.card_no = 'YKMJ2009273LJLN' AND cv.platform = 'YK' ORDER BY cv.created_time DESC;

use card_dev;
select * from platform_permission where instr((select ldap_platform from platform_permission where ldap_name = 'zhuzq07'), 'YK') > 0;

select count(id) from platform_permission where ldap_name = 'zhuzq07' and instr(ldap_platform, 'YK') > 0;


select count(id) from platform_permission where ldap_name = ? and instr(ldap_platform, ?) > 0;

USE CARD;
select soae.outer_close_account_org_name from stock_out_apply soa
    left join stock_out_apply_extends soae on  soae.apply_code = soa.apply_code where out_style = '2';

select soa.apply_code,t.sale_price, soa.apply_number, soa.updated_time, soae.outer_close_account_org_code, soae.outer_close_account_org_name from stock_out_apply  soa
    left join stock_out_apply_extends soae on soae.apply_code = soa.apply_code
    left join template t on t.code = soa.template_code
where soa.apply_code in ('BBCK200930008', 'BBCK200930013', 'BBCK200930001', 'BBCK200930010', 'BBCK200930006');

select * from stock_out_apply where id = (
    select apply_id from stock_out_apply_detail where card_id = (
        select id from card where card_no = 'BBMJ200929N2P4B'));

select * from template where type in ('1', '2', '4');
select t.id from template t
    left join template_rights tr on t.id = tr.template_id
where t.type in ('1', '2');

-- 模板查询列表的SQL
select * from (select tr.template_id, min(s.id) as stock_id, min(stock_mode) as stock_mode, min(t.code) as template_code, min(t.name) as card_name, min(t.type) as card_type, min(t.description) as card_use_desc, min(t.platform) as platfrom, min(t.created_time) as created_time, min(base) as base, min(quota) as quota, min(total_number) as right_total_number from template t
    left join template_rights tr on t.id = tr.template_id
    left join base_rights br on tr.right_id = br.id
    left join stock s on t.id = s.template_id
where ((type = '1' and total_number = 1) or type = '2') and t.sale_price = 0 and s.stock_mode = '2'
group by tr.template_id having count(tr.template_id) = 1
union all
select t.id as template_id, s.id as stock_id, stock_mode as stock_mode, t.code as template_code, t.name as card_name, t.type as card_type, t.description as card_use_desc, t.platform as platform, t.created_time, null, null, null from template t
    left join stock s on t.id = s.template_id
where type = '4' and t.sale_price = 0 and s.stock_mode = '2' and exists (
    select * from template_rights tr where t.id = tr.template_id
    ) ) template_base_info where platfrom = 'BB' order by created_time desc;
-- End

select template_id,count(template_id) right_num from template t
          left join template_rights tr on t.id = tr.template_id
      where type in ('1', '2')
      group by template_id having right_num = 1;

select min(t.id) as template_id, min(code) as template_code, group_concat(tr.id) as right_list, group_concat(group_code) as group_code_list from template t
    left join template_rights tr on t.id = tr.template_id;

select t.id, min(t.code), tr.id, tr.group_code from template t
    left join template_rights tr on t.id = tr.template_id
group by t.id;


-- 卡券统计性能优化
select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id,
       t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_id as settlement_org_id,
       sia.settlement_org_name as settlement_org_name from card c
       left join template t on c.template_id = t.id
       inner join stock_in_apply_detail siad on c.id = siad.card_id
       left join stock_in_apply sia on siad.apply_id = sia.id
where c.platform = 'BB' order by c.updated_time desc
limit 0, 20;
-- 卡券统计性能优化 End --

select * from base_rights br where isnull(rights_detail-> '$.rights_desc') and platform = 'BB';

select * from base_rights where code in
(select code from base_rights where isnull(rights_detail) = 1 and platform = 'BB') and platform = 'BB';

select * from rights_bybo_items where right_id in (296, 302, 305, 307)
( select  *
from base_rights
where platform = 'BB' and json_type(rights_detail->'$.rightsDesc') = 'NULL');

select * from base_rights br
    left join rights_bybo_items rbi on rbi.right_id = br.id
where rights_type = '4'

-- 查询单个权益的 rights_detail
select min(br.code) as code, json_object('rightsDetail', min(desc_tmp.item_list), 'rightsDesc', min(desc_tmp.rights_desc)) as rights_detail
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

    group by br.id;
-- End --

-- 查询单个权益的项目信息 --
select json_arrayagg(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level))
    from rights_bybo_items
    where platform = 'BB' and right_id = 254
group by right_id
union all
select json_arrayagg(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level))
    from yk_rights_items
    where platform = 'YK' and right_id = 254
group by right_id
-- End --

--
SELECT id,code,base,quota,top,has_top,rights_type,selling_price,settlement_price,office_id,office_name,item_code_path,rights_detail,is_availability,version,created_by_id,created_by_name,created_time,updated_by_id,updated_by_name,updated_time,platform FROM base_rights WHERE id = 694 AND is_availability = 1 AND platform = 'BB';

--
select json_arrayagg(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)) from rights_bybo_items where platform = 'BB' and right_id = 694 group by right_id union all select json_arrayagg(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)) from yk_rights_items where platform = 'YK' and right_id = 694 group by right_id

UPDATE template SET code=?, name=?, description=?, type=?, sale_price=?, apply_org=?, apply_org_path=?, apply_org_name=?, apply_nationwide=?, activation_period_type=?, activation_start_date=?, activation_end_date=?, activation_period=?, activation_unit=?, service_start_date=?, service_end_date=?, service_period_type=?, service_period=?, service_unit=?, is_online_product=?, created_by_id=?, created_by_name=?, created_time=?, updated_by_id=?, updated_by_name=?, updated_time=? WHERE id=?


-- 卡券统计优化
select c.id as card_id, c.type as template_type, c.*, t.code as template_code, t.id as template_id, t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_id as settlement_org_id, sia.settlement_org_name as settlement_org_name
    from card c
        left join template t on c.template_id = t.id
        inner join stock_in_apply_detail siad on c.id = siad.card_id
        left join stock_in_apply sia on siad.apply_id = sia.id
WHERE c.platform = 'BB'  order by c.updated_time LIMIT 0,20

select * from card c
WHERE c.platform = 'BB' order by updated_time desc LIMIT 0,20

select c.id as card_id, c.type as template_type, t.code as template_code, t.id as template_id, t.name as templateName, sia.is_ecard as is_ecard, sia.settlement_org_id as settlement_org_id, sia.settlement_org_name as settlement_org_name, c.*
    from card c
        left join template t on c.template_id = t.id
        inner join stock_in_apply_detail siad on c.id = siad.card_id
        left join stock_in_apply sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' ORDER BY c.updated_time DESC LIMIT 0,20

-- 查询卡的权益的剩余使用次数
select * from card_rights where (isnull(group_code) = 1 || group_code = 'a')

select geometrytype(json_arrayagg(right_id)), json_arrayagg(right_id) from template_rights
    order by template_id

select json_array(right_id) from template_rights

select rights_detail from base_rights




select br.id, group_concat(rbi.id),
        (
            concat('[',
               group_concat(
                       json_unquote(
                               json_object('itemId', rbi.id, 'itemCode', rbi.code, 'itemName', rbi.name, 'salePrice',
                                           rbi.sale_price)
                       )
               ), ']'
            )
        ) from base_rights br
    left join rights_bybo_items rbi on br.id = rbi.right_id
group by br.id;

call sp_print_result('7, 8, 9', ',')


SELECT json_type(JSON_QUOTE('[1, 2, 3]'));

-- 不使用 json_arrayagg
select rights_desc from
      (
          select id,
                 code,
                 concat('抵扣金额', round(quota / 100, 2), '元，',
                        if(base = 0, '无门槛', concat('满', round(base / 100, 2), '元可用'))) as rights_desc
          from base_rights
          where rights_type = '1'
          union all
          select id,
                 code,
                 concat(round(quota / 100, 2), '%折扣，',
                        if(base = 0, '无门槛，', concat('满', round(base / 100, 2), '元可用，')),
                        if(has_top = 1, concat('折扣上限', round(top / 100, 2), '元'), '折扣无上限')) as rights_desc
          from base_rights
          where rights_type = '2'
          union all
          select id,
                 code,
                 concat('储值金额', round((base + quota) / 100, 2), '元（本金', round(base / 100, 2), '元，馈赠金',
                        round(quota / 100, 2), '元）') as rights_desc
          from base_rights
          where rights_type = '3'
          union all
          (select br.id as id, min(br.code) as code, group_concat(rbi.name) as rights_desc

           from base_rights br
                    inner join rights_bybo_items rbi on rbi.right_id = br.id
           where br.rights_type = '4'
             and br.platform = 'BB'
           group by br.id)
          union all
          (select br.id as id, min(br.code) as code, group_concat(yri.name) as rights_desc

           from base_rights br
                    inner join yk_rights_items yri on yri.right_id = br.id
           where br.rights_type = '4'
             and br.platform = 'YK'
           group by br.id)
      ) tmp where id = 256


-- 查询 itemList group_concat 替换 json_arrayagg
 select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']')
                         from rights_bybo_items
                         where platform = 'BB' and right_id = 716
                     group by right_id
                     union all
                     select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']')
                         from yk_rights_items
                         where platform = 'YK' and right_id = 716
                     group by right_id
-- End json_arrayagg


-- 卡券导出查询接口
select c.id as card_id, c.type as type, c.card_no, state,
       c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date,
       c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date,
       t.code as template_code, t.id as template_id, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
    from card c
        inner join (select id, code from template) t on c.template_id = t.id
        inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
        left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' order by updated_time desc limit 0, 300000

select c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date, c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date, t.code as template_code, t.id as template_id, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name from card c inner join (select id, code from template) t on c.template_id = t.id inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id WHERE c.platform = 'BB' ORDER BY updated_time DESC LIMIT 0,20

-- 分页的前置查询
SELECT COUNT(1) FROM card c
    INNER JOIN (SELECT id, code FROM template) t ON c.template_id = t.id
    INNER JOIN (SELECT card_id, apply_id FROM stock_in_apply_detail) siad ON c.id = siad.card_id
    LEFT JOIN (SELECT id, is_ecard, settlement_org_id, settlement_org_name FROM stock_in_apply) sia ON siad.apply_id = sia.id
WHERE c.platform = 'BB'

SELECT COUNT(1) FROM card c INNER JOIN (SELECT id, code FROM template) t ON c.template_id = t.id INNER JOIN (SELECT card_id, apply_id FROM stock_in_apply_detail) siad ON c.id = siad.card_id LEFT JOIN (SELECT id, is_ecard, settlement_org_id, settlement_org_name FROM stock_in_apply) sia ON siad.apply_id = sia.id WHERE c.platform = 'BB' AND (c.state = 12 OR c.state = 4)

select count(id) from card
select * from card limit 10, 20

--
select rights_desc from
            (select id, code, concat('抵扣金额', round(quota / 100, 2), '元，',
                  if(base = 0, '无门槛', concat('满', round(base / 100, 2), '元可用'))) as rights_desc
              from base_rights
              where rights_type = '1'
              union all
              select id, code, concat(round(quota / 100, 2), '%折扣，',
                            if(base = 0, '无门槛，', concat('满', round(base / 100, 2), '元可用，')),
                                if(has_top = 1, concat('折扣上限', round(top / 100, 2), '元'), '折扣无上限')) as rights_desc
              from base_rights
              where rights_type = '2'
              union all
              select id, code, concat('储值金额', round((base + quota) / 100, 2), '元（本金', round(base / 100, 2), '元，馈赠金',
                            round(quota / 100, 2), '元）') as rights_desc
              from base_rights
              where rights_type = '3'
              union all
              (select br.id as id, min(br.code) as code, group_concat(rbi.name) as rights_desc
               from base_rights br
                        inner join rights_bybo_items rbi on rbi.right_id = br.id
               where br.rights_type = '4' and br.platform = 'BB'
               group by br.id)
              union all
              (select br.id as id, min(br.code) as code, group_concat(yri.name) as rights_desc
               from base_rights br
                        inner join yk_rights_items yri on yri.right_id = br.id
               where br.rights_type = '4' and br.platform = 'YK'
               group by br.id)
          ) tmp where id = 256


-- 错误
select cv.verification_org_id, cv.verification_org_name, cv.verification_name, cv.phone, cv.marketing_manager, cv.created_time , c.name as card_name, c.type as card_type, c.card_no as card_no,t.id as templateId, t.code as templateCode, sia.settlement_org_name as settlement_org_name, sia.settlement_org_id as settlement_org_id,
    tmp.rights_desc as rights_desc
from card_verification cv
    left join card  c on c.id = cv.card_id
    left join template t on c.template_id = t.id
    left join stock_in_apply sia on sia.id = (select apply_id from stock_in_apply_detail siad where siad.card_id = cv.card_id)
    left join (select id, code, concat('抵扣金额', round(quota / 100, 2), '元，',                   if(base = 0, '无门槛', concat('满', round(base / 100, 2), '元可用'))) as rights_desc               from base_rights               where rights_type = '1'               union all               select id, code, concat(round(quota / 100, 2), '%折扣，',                             if(base = 0, '无门槛，', concat('满', round(base / 100, 2), '元可用，')),                                 if(has_top = 1, concat('折扣上限', round(top / 100, 2), '元'), '折扣无上限')) as rights_desc               from base_rights               where rights_type = '2'               union all               select id, code, concat('储值金额', round((base + quota) / 100, 2), '元（本金', round(base / 100, 2), '元，馈赠金',                             round(quota / 100, 2), '元）') as rights_desc               from base_rights               where rights_type = '3'               union all               (select br.id as id, min(br.code) as code, group_concat(rbi.name) as rights_desc                from base_rights br                         inner join rights_bybo_items rbi on rbi.right_id = br.id                where br.rights_type = '4' and br.platform = 'BB'                group by br.id)               union all               (select br.id as id, min(br.code) as code, group_concat(yri.name) as rights_desc                from base_rights br                         inner join yk_rights_items yri on yri.right_id = br.id                where br.rights_type = '4' and br.platform = 'YK'                group by br.id)           ) tmp on tmp.id = cv.right_id WHERE cv.platform = 'BB' ORDER BY cv.created_time DESC LIMIT 0,100000


select cv.verification_org_id, cv.verification_org_name, cv.verification_name, cv.phone, cv.marketing_manager, cv.created_time , c.name as card_name, c.type as card_type, c.card_no as card_no,t.id as templateId, t.code as templateCode, sia.settlement_org_name as settlement_org_name, sia.settlement_org_id as settlement_org_id,      tmp.rights_desc as rights_desc  from card_verification cv      left join card  c on c.id = cv.card_id      left join template t on c.template_id = t.id left join stock_in_apply sia on sia.id = (select apply_id from stock_in_apply_detail siad where siad.card_id = cv.card_id) left join (select id, code, concat('抵扣金额', round(quota / 100, 2), '元，',                   if(base = 0, '无门槛', concat('满', round(base / 100, 2), '元可用'))) as rights_desc               from base_rights               where rights_type = '1'               union all               select id, code, concat(round(quota / 100, 2), '%折扣，',                             if(base = 0, '无门槛，', concat('满', round(base / 100, 2), '元可用，')),                                 if(has_top = 1, concat('折扣上限', round(top / 100, 2), '元'), '折扣无上限')) as rights_desc               from base_rights               where rights_type = '2'               union all               select id, code, concat('储值金额', round((base + quota) / 100, 2), '元（本金', round(base / 100, 2), '元，馈赠金',                             round(quota / 100, 2), '元）') as rights_desc               from base_rights               where rights_type = '3'               union all               (select br.id as id, min(br.code) as code, group_concat(rbi.name) as rights_desc                from base_rights br                         inner join rights_bybo_items rbi on rbi.right_id = br.id                where br.rights_type = '4' and br.platform = 'BB'                group by br.id)               union all               (select br.id as id, min(br.code) as code, group_concat(yri.name) as rights_desc                from base_rights br                         inner join yk_rights_items yri on yri.right_id = br.id                where br.rights_type = '4' and br.platform = 'YK'                group by br.id)           ) tmp on tmp.id = cv.right_id WHERE cv.platform = 'BB' ORDER BY cv.created_time DESC LIMIT 0,100000

-- 设置 group_concat 的最大长度
use card_dev;
set global group_concat_max_len = 1024;

show global variables like 'group_concat_max_len';
-- End --

-- 根据内部结算主体id来查询
select * from outter_settlement_org
    where instr(
        concat(',', '7,8,111', ','), concat(',', id, ',')
              )
-- End --


-- 核销统计解除 group_concat 依赖
select cv.verification_org_id, cv.verification_org_name, cv.verification_name, cv.phone, cv.marketing_manager, cv.created_time , c.name as card_name, c.type as card_type, c.card_no as card_no,t.id as templateId, t.code as templateCode, sia.settlement_org_name as settlement_org_name, sia.settlement_org_id as settlement_org_id,
                         tmp.rights_desc as rights_desc
                     from card_verification cv
                         left join card  c on c.id = cv.card_id
                         left join template t on c.template_id = t.id
                     left join stock_in_apply sia on sia.id = (select apply_id from stock_in_apply_detail siad where siad.card_id = cv.card_id)
                     left join (select id, code, json_unquote(rights_detail->'$.rightsDesc') as rights_desc from base_rights
                               ) tmp on tmp.id = cv.right_id
-- End --

select online_retailers_id, online_retailers_code, online_retailers_name from template
    where concat(',', online_retailers_id, ',') like '%,8,%';

select right_id, code, name, level, round(sale_price / 100, 2), sale_price, is_availability
    from rights_bybo_items
    where platform = 'BB' and right_id = 970 and is_availability = 1
union all
select right_id, code, name, level, round(sale_price / 100, 2), sale_price, is_availability
    from yk_rights_items
where platform = 'YK' and right_id = 970 and is_availability = 0;

select count(*) from card;
select count(1) from card where is_availability = 1 and platform = 'BB'

select count(1) from card c
    inner join (select id, code from template) t on c.template_id = t.id
    inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
    left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.is_availability = 1 order by c.updated_time desc limit 0, 20
show table status from card

select * from card.base_rights where unix_timestamp(created_time) < 1606387604919 order by created_time desc

select unix_timestamp('2020-11-25')

select c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date, c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date, t.code as template_code, t.id as template_id, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name from card c inner join (select id, code from template) t on c.template_id = t.id inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id WHERE c.platform = 'BB' AND c.is_availability = 1 AND unix_timestamp(c.created_time) <= 1606449447265 ORDER BY c.updated_time DESC , c.id DESC limit 0, 100000

-- 杀掉数据库的所有链接
select replace(group_concat(concat('KILL ',id,';')), ',', '') from information_schema.processlist
        where user='card' and db = 'card' order by 1;

-- 查询数据库的所有连接
select group_concat(concat('KILL ',id)) from information_schema.processlist
        where user = 'card' and db = 'card' group by USER;

KILL 28451;

use card;
select group_concat(concat('KILL ',id)) from information_schema.processlist
where user='card' and db = 'card' group by id;

select replace(group_concat(concat('KILL ',id,';')), ',', '') from information_schema.processlist
where user='card' and db = 'card_dev' order by 1;
KILL 292228;KILL 292156;KILL 292227;KILL 292223;KILL 292230;KILL 292224;KILL 292231;KILL 292222;KILL 292226;KILL 292225;KILL 292229;


select count(1) from (select c.id from card c) tmp;

select count(1) from card;
-- 真正的查询
select c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date, c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date, t.code as template_code, t.id as template_id, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name from card c inner join (select id, code from template) t on c.template_id = t.id inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id WHERE c.platform = 'BB' AND c.is_availability = 1 ORDER BY updated_time DESC LIMIT 0,20

select max(id) - min(id) from card

-- card
select count(*) from card c
    inner join (select id, code from template) t on c.template_id = t.id
    inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
    left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.is_availability = 1

--
reset query cache ;
select count(1) from card c
    inner join template t on c.template_id = t.id
    inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on sia.id = (select apply_id from stock_in_apply_detail where card_id = c.id)
WHERE c.platform = 'BB' AND c.is_availability = 1;

--
SELECT COUNT(1) FROM card c INNER JOIN (SELECT id, code FROM template) t ON c.template_id = t.id INNER JOIN (SELECT card_id, apply_id FROM stock_in_apply_detail) siad ON c.id = siad.card_id LEFT JOIN (SELECT id, is_ecard, settlement_org_id, settlement_org_name FROM stock_in_apply) sia ON siad.apply_id = sia.id WHERE c.platform = 'BB' AND c.is_availability = 1


select ifnull((select id from card where card_no = 'YKXM201204UU4Q8' order by id limit 1, 1), null) as id

select isnull(id)  as SecondHighestSalary from card where card_no = 'YKXM201204UU4Q8' order by id desc limit 1, 1

SELECT COUNT(1) FROM card c
    INNER JOIN (SELECT id, code, is_job_price FROM template) t ON c.template_id = t.id
    INNER JOIN (SELECT card_id, apply_id FROM stock_in_apply_detail) siad ON c.id = siad.card_id
    LEFT JOIN (SELECT id, is_ecard, settlement_org_id, settlement_org_name FROM stock_in_apply) sia ON siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.is_availability = 1 AND sia.settlement_org_id = 25

--
SELECT COUNT(1) FROM card c
    INNER JOIN template t ON c.template_id = t.id
    LEFT JOIN stock_in_apply sia ON sia.id = (SELECT apply_id FROM stock_in_apply_detail siad where siad.card_id = c.id)
WHERE c.platform = 'BB' AND c.is_availability = 1 AND sia.settlement_org_id = 25

create index idx_settlement_org_id
	on stock_in_apply (settlement_org_id);

select count(1) from card where id in (
select card_id from stock_in_apply_detail where apply_id in
    (select id from stock_in_apply ) )
    and platform = 'BB' and is_availability = 1

select count(1) as card_number from card;
select count(1) as siad_number from stock_in_apply_detail;

select * from stock_in_apply_detail group by card_id having count(card_id) > 1;

show variables like 'max_allowed_packet';

reset query cache;
select count(1) from stock_in_apply_detail siad
    inner join card c on siad.card_id = c.id
    inner join template on c.template_id = template.id
    where c.platform = 'BB' and c.is_availability = 1;

reset query cache;
select count(1) from stock_in_apply_detail siad
    inner join (select id, card_no, type, state, platform, is_availability from card) c on siad.card_id = c.id
    inner join  stock_in_apply sia on sia.id = siad.apply_id
    where c.platform = 'BB' and c.is_availability = 1; -- and siad.apply_id in (select id from stock_in_apply where settlement_org_id = 25);



reset query cache;
select count(1) from stock_in_apply_detail siad
    inner join card c on siad.card_id = c.id
    inner join  stock_in_apply sia on sia.id = siad.apply_id
    inner join template t on c.template_id = t.id
    where c.platform = 'BB' and c.is_availability = 1 -- and siad.apply_id in (select id from stock_in_apply where settlement_org_id = 25);

select count(1) from card c where c.type like '%%' and state like '%%' and c.card_no like '%%' and c.platform like '%%' and c.is_availability = 1

select count(1) as card_number, sum(sale_price / 100) as sum_sale_price from card
union all
select  count(1), sum(sale_price / 100) from card
    where state in (4, 5, 6, 9, 12, 13)
union all
select count(1), null from card
    where sale_price = 0;

-- 查询各个状态的卡的数量和总售价
select count(state = '1' or null), count(state = '2' or null), count(state = '3' or null), count(state = '4' or null), count(state = '5' or null), count(state = '6' or null),
       count(state = '7' or null), count(state = '8' or null), count(state = '9' or null), count(state = '10' or null), count(state = '11' or null), count(state = '12' or null) , count(state = '13' or null)
from card
union all
select sum(if(state = '1', sale_price / 100, 0)),  sum(if(state = '2', sale_price / 100, 0)), sum(if(state = '3', sale_price / 100, 0)), sum(if(state = '4', sale_price / 100, 0)),
       sum(if(state = '5', sale_price / 100, 0)),  sum(if(state = '6', sale_price / 100, 0)), sum(if(state = '7', sale_price / 100, 0)), sum(if(state = '8', sale_price / 100, 0)),
       sum(if(state = '9', sale_price / 100, 0)), sum(if(state = '10', sale_price / 100, 0)), sum(if(state = '11', sale_price / 100, 0)), sum(if(state = '12', sale_price / 100, 0)),
       sum(if(state = '13', sale_price / 100, 0))
       from card;

select count(current_state = '3' or null), count(current_state = '4' or null), count(current_state = '5' or null)
    from card_life_logs
    order by card_id;


select count(1), count(c.sale_price > 2000 or null), sum(c.sale_price /100) from card_active ca
    inner join card c on ca.card_id = c.id;

select count(1), count(c.sale_price > 2000 or null), sum(c.sale_price /100) from card_get cg
    inner join card c on cg.card_id = c.id;

select count(1), sum(used_time) from card_verification cv
    inner join base_rights br on cv.right_id = br.id;


-- 自动入库的内部结算主体的刷入
select * from card
    where isnull(settlement_org_id) = 1 and platform = 'BB'

select stock_id, group_concat(distinct(settlement_org_id)) from card
    group by stock_id;

-- 自动补库存的卡的明细的修改

select * from stock_in_apply_detail siad
    left join card c on siad.card_id = c.id
    where (select template_id from stock_in_apply sia where sia.id = siad.apply_id) != c.template_id

-- 将错误的 apply_id 先全部刷成 null
update stock_in_apply_detail siad set apply_id = null
    where (select template_id from stock_in_apply sia where sia.id = siad.apply_id) != (select template_id from card where id = siad.card_id)

-- 将为 null 的 apply_id 刷成正确的数据
update stock_in_apply_detail siad, (
    select siad.id as id, sia.id as acutal_apply_id from stock_in_apply_detail siad
    left join card c on c.id = siad.card_id
    left join stock_in_apply sia on c.template_id = sia.template_id and sia.type = '2'
    where isnull(siad.apply_id) = 1
    ) tmp set siad.apply_id = tmp.acutal_apply_id
where siad.id = tmp.id;

-- 查看是否有的 card_id 对应多个siad的记录
select card_id from stock_in_apply_detail
    group by card_id having count(card_id) > 1;
-- 测试环境没有

select siad.id, siad.card_id, c. id, sia.id, siad.apply_id from stock_in_apply_detail siad
    left join card c on c.id = siad.card_id
    left join stock_in_apply sia on c.template_id = sia.template_id and sia.type = '2'
    where isnull(siad.apply_id) = 1

-- 修复岗位优惠卡的 bug
select count(1) from card c WHERE c.platform = 'BB' AND c.is_job_price = 1 AND c.is_availability = 1

select c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date, c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date, t.code as template_code, t.id as template_id, t.is_job_price as is_job_price, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
from card c
    inner join (select id, code, is_job_price from template) t on c.template_id = t.id
    inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
    inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.is_availability = 1 AND t.is_job_price = 1 AND c.is_job_price = 1 ORDER BY updated_time DESC LIMIT 0,20

show engines;
show variables like 'innodb_version';

show variables like 'innodb_%io_threads';

show engine innodb status;

show variables  like 'innodb_purge_threads';

show variables like 'innodb_buffer_pool_size';

show variables like 'innodb_buffer_pool_instances';

-- innodb
select pool_id, pool_size, free_buffers, database_pages
    from INNODB_BUFFER_POOL_STATS;

show variables like 'innodb_old_blocks_pct';

-- 核销统计需求变更
select type, name, card_no,  from card

-- 核销统计的查询
select verification_name, phone, verification_org_id, verification_org_name, out_close_account_org_id, right_id, pay_style, out_style, cv.created_time as created_time, marketing_manager,
       c.type as card_type, c.name as card_name, c.card_no, c.settlement_org_id as settlement_org_id, sale_price,
       cis.name as settlement_org_name, oso.name as out_close_account_org_name
    from card_verification cv
    inner join card c on cv.card_id = c.id
    left join (select id, name, code from inner_settlement_org) cis on cis.id = c.settlement_org_id
    inner join (select id, name, code from outter_settlement_org) oso on oso.id = cv.out_close_account_org_id;


-- 核销的统计
select count(1) from card_verification cv
    inner join card c on c.id = cv.card_id

select count(1)
    from card_verification cv
    inner join card c on cv.card_id = c.id
    inner join (select id, name, code from inner_settlement_org) cis on cis.id = c.settlement_org_id
    inner join (select id, name, code from outter_settlement_org) oso on oso.id = cv.out_close_account_org_id;

select verification_name, phone, verification_org_id, verification_org_name, out_close_account_org_id, right_id, pay_style, out_style, cv.created_time as created_time, marketing_manager, c.type as card_type, c.name as card_name, c.card_no, c.settlement_org_id as settlement_org_id, sale_price, cis.name as settlement_org_name, oso.name as out_close_account_org_name
    from card_verification cv
        inner join card c on cv.card_id = c.id
        inner join (select id, name, code from inner_settlement_org) cis on cis.id = c.settlement_org_id
        left join (select id, name, code from outter_settlement_org) oso on oso.id = cv.out_close_account_org_id
WHERE cv.out_style = '1' AND cv.platform = 'BB' AND cv.is_availability = 1 ORDER BY cv.updated_time DESC

select verification_name, phone, verification_org_id, verification_org_name, out_close_account_org_id, right_id, pay_style, out_style, cv.created_time as created_time, marketing_manager, c.type as card_type, c.name as card_name, c.card_no, c.settlement_org_id as settlement_org_id, sale_price, cis.name as settlement_org_name, oso.name as out_close_account_org_name from card_verification cv inner join card c on cv.card_id = c.id inner join (select id, name, code from inner_settlement_org) cis on cis.id = c.settlement_org_id left join (select id, name, code from outter_settlement_org) oso on oso.id = cv.out_close_account_org_id left join (select id, code, json_unquote(rights_detail->'$.rightsDesc') as rights_desc from base_rights ) tmp on tmp.id = cv.right_id WHERE cv.platform = 'BB' AND cv.is_availability = 1 AND unix_timestamp(cv.created_time) <= 1609922192647 ORDER BY cv.updated_time DESC , cv.id DESC LIMIT 0,100000

select c.id , oso.id as out_close_account_org_id, soa.out_style as out_style, soae.pay_style as pay_style
    from card c
    inner join stock_out_apply_detail soad on c.id = soad.card_id
    left join stock_out_apply soa on soa.id = soad.apply_id
    left join stock_out_apply_extends soae on soae.apply_code = soa.apply_code
    left join outter_settlement_org oso on oso.code = soae.outer_close_account_org_code
union all
select oso.id
    from card c
    inner join card_get cg on cg.card_id = c.id
    left join outter_settlement_org oso on cg.online_product_channel = oso.code
where c.id = 1092826
select