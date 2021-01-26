create database card;

SELECT COUNT(1) FROM card_verification cv LEFT JOIN card c ON c.id = cv.card_id LEFT JOIN stock_in_apply sia ON sia.stock_id = c.stock_id WHERE DATE_FORMAT(cv.created_time, '%Y.%m.%d') = '2020.09.04';

ALTER TABLE base_rights ADD office_id bigint(19) DEFAULT NULL COMMENT '事业部id 仅拜博有此字段';
ALTER TABLE base_rights ADD office_name varchar(60) DEFAULT NULL COMMENT '事业部名称 仅拜博有此字段';


--  ********************************************************* --
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
select br.id as id, min(br.rights_type) as rights_type, group_concat(rbi.id) as item_id, json_object('rightsDetail', if(isnull(min(rbi.id)) = 1, null, json_array(group_concat(json_object('itemId', rbi.id, 'itemCode', rbi.code, 'itemName', rbi.name, 'salePrice', rbi.sale_price)))), 'rightsDesc', min(desc_tmp.rights_desc)) as rights_detail
    from base_rights br
    left join (
    select id, code, concat('抵扣金额', round(quota / 100, 2), '元，', if(base = 0, '无门槛', concat('满', round(base / 100, 2), '元可用'))) as rights_desc, base, quota, rights_type
    from base_rights where rights_type = '1' and platform = 'BB'
union all
select id, code, concat(round(quota / 100, 2), '%折扣，', if(base = 0, '无门槛，', concat('满', round(base / 100, 2), '元可用，')), if(has_top = 1, concat('折扣上限', round(top / 100, 2), '元'), '折扣无上限')) as rights_desc, base, quota, rights_type
    from base_rights where rights_type = '2' and platform = 'BB'
union all
select id, code, concat('储值金额', round((base + quota) / 100, 2), '元（本金', round(base / 100, 2), '元，馈赠金', round(quota / 100, 2), '元）' ) as rights_desc, base, quota, rights_type
    from base_rights where rights_type = '3' and platform = 'BB'
union all
(select br.id as id, min(br.code) as code, group_concat(rbi.name) as rights_desc, min(br.base) as base, (br.quota) as quota, min(br.rights_type) as rights_type
    from base_rights br
    inner join rights_bybo_items rbi on rbi.right_id = br.id
    where br.rights_type = '4' and br.platform = 'BB'
    group by br.id)
        ) desc_tmp on br.id = desc_tmp.id
    left join rights_bybo_items rbi on rbi.right_id = br.id
    group by br.id ) tmp set br.rights_detail = tmp.rights_detail
where br.id = tmp.id and platform = 'BB';
-- End --
-- ****************************************************** --

create database bybotest01;