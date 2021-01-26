update card.card set card.card.activation_unit = 2
where activation_period_type = '2' and isnull(activation_unit) = 1;

update card set service_unit = 2
where service_period_type = '2' and isnull(service_unit) = 1;

update card_rights set group_code = ''
  where isnull(group_code) = 1;

update stock_out_apply set inner_code = 'KV01'
    where id < 203;

-- rbi.name as item_name, rbi.code as item_code, rbi.sale_price as sale_price
create database card_dev;

-- base_rights 权限信息的刷数据 SQL --
update base_rights br, (
select br.id as id, json_object('rights_detail', json_arrayagg(json_object('item_id', rbi.id, 'item_code', rbi.code, 'item_name', rbi.name, 'sale_price', rbi.sale_price))) as rights_detail
    from base_rights br
    inner join rights_bybo_items rbi on rbi.right_id = br.id
    group by br.id ) tmp set br.rights_detail = tmp.rights_detail
where br.id = tmp.id and platform = 'BB';
-- End --

SET group_concat_max_len=102400;

-- base_rights 项目路径 SQL --
update base_rights br, (
    select br.id as id, replace(replace(concat('[', group_concat(concat('[', rbi.code, ']')), ']'), ',00', ''), '[]', '') as item_code_path
    from base_rights br
left join rights_bybo_items rbi on rbi.right_id = br.id
group by br.id
    ) tmp set br.item_code_path = tmp.item_code_path
where br.id = tmp.id and br.platform = 'BB';
-- End --

-- base_rights 的权益描述--
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
    left join rights_bybo_items rbi on rbi.right_id = br.id
    where br.rights_type = '4' and br.platform = 'BB'
    group by br.id);
-- End --

--  ********************************************************* --
-- 先全部清为 null
update base_rights set rights_detail = null
    where id > 0;
-- End --
-- 设置 group_concat 函数的最大长度 单次会话有效
SET global group_concat_max_len=102400;
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

-- 查询单个权益的 rights_detail
select json_object('rightsDetail', if(isnull(min(rbi.id)) = 1, null, json_arrayagg(json_object('itemId', rbi.id, 'itemCode', rbi.code, 'itemName', rbi.name, 'salePrice', rbi.sale_price))), 'rightsDesc', min(desc_tmp.rights_desc)) as rights_detail
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

    group by br.id
-- End --

-- update template is_nationalwide
update template set apply_nationwide = 0
    where id > 0;
-- End --

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
select br.id as id, min(br.rights_type) as rights_type, group_concat(rbi.id) as item_id, json_object('rightsDetail', if(isnull(min(rbi.id)) = 1, null, json_arrayagg(json_object('itemId', rbi.id, 'itemCode', rbi.code, 'itemName', rbi.name, 'salePrice', rbi.sale_price))), 'rightsDesc', min(desc_tmp.rights_desc)) as rights_detail
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

INSERT INTO base_rights ( code, base, quota, top, has_top, rights_type, selling_price, settlement_price, office_id, office_name, item_code_path, is_availability, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform )
VALUES ( 'MJ0149', 10000, 4000, 0, 0, 1, 2000, 0, 42, '河南事业部', '[["2000000000"],["2100000000"],["2200000000"]]', 1, '0e9028eaa16c448298c91f02e1a9ea49', '朱志强', '2020-11-23 19:22:42.09', '0e9028eaa16c448298c91f02e1a9ea49', '朱志强', '2020-11-23 19:22:42.09', 'BB' )

update template set is_job_price = 1
    where id > 0;

update card set settlement_org_id = 25
    where stock_id = 434

-- 将外部结算主体的ID刷入到核销表中
update card_verification cv, (
    select cv.id as id, cv.card_id, oso.id as out_close_account_org_id
    from card_verification cv
    left join stock_out_apply_detail soad on cv.card_id = soad.card_id
    left join stock_out_apply soa on soa.id = soad.apply_id
    left join stock_out_apply_extends soae on soae.apply_code = soa.apply_code
    left join outter_settlement_org oso on oso.code = soae.outer_close_account_org_code
    ) tmp set cv.out_close_account_org_id = tmp.out_close_account_org_id
    where cv.id = tmp.id;

-- 将出库类型刷入到核销表中
update card_verification cv, (
    select cv.id as id, cv.card_id, oso.id as out_close_account_org_id, soa.out_style as out_style
    from card_verification cv
    left join stock_out_apply_detail soad on cv.card_id = soad.card_id
    left join stock_out_apply soa on soa.id = soad.apply_id
    left join stock_out_apply_extends soae on soae.apply_code = soa.apply_code
    left join outter_settlement_org oso on oso.code = soae.outer_close_account_org_code
    ) tmp set cv.out_style = tmp.out_style
    where cv.id = tmp.id;

-- 没有出库类型的统一认为是自动入库类型的
update card_verification cv set out_style = '5'
    where isnull(out_style) = 1;

-- 出库类型为 5 的使用 card_get 表的外部电商渠道设置外部结算主体
update card_verification cv set out_close_account_org_id = (
    select oso.id from card_get cg
    left join outter_settlement_org oso on cg.online_product_channel = oso.code and cg.is_availability = 1
    where cg.card_id = cv.card_id
    ) where out_style = '5';

-- 将售卖方式刷入到核销表中
update card_verification cv, (
    select cv.id as id, cv.card_id, oso.id as out_close_account_org_id, soa.out_style as out_style, soae.pay_style as pay_style
    from card_verification cv
    left join stock_out_apply_detail soad on cv.card_id = soad.card_id
    left join stock_out_apply soa on soa.id = soad.apply_id
    left join stock_out_apply_extends soae on soae.apply_code = soa.apply_code
    left join outter_settlement_org oso on oso.code = soae.outer_close_account_org_code
    ) tmp set cv.pay_style = tmp.pay_style
    where cv.id = tmp.id;

-- 按照创建人来刷新事业部
-- 权益的事业部的 ID 和 name
-- 事业部的 ID

-- 在 platform_permission 表中冗余 userCd 字段,用来加快 userCd 的匹配速度
alter table platform_permission
    add `user_cd` varchar(100) default null comment '用户中心的ID';

-- 将user_cd 刷入到 platform_permission 之中
update platform_permission pp, oa_user
    set pp.user_cd = oa_user.user_cd
where pp.ldap_name = oa_user.login_name;

update base_rights br set office_id = (select distinct office_id from platform_permission pp
    where pp.user_cd = br.created_by_id and pp.is_availability = 1)
where isnull(br.office_id);

-- 事业部的 name
update base_rights br, (
    select pp.office_id, pp.office_name from platform_permission pp
    ) tmp set br.office_name = tmp.office_name
    where br.office_id = tmp.office_id;

-- 模板的事业部的 ID 和 name
-- 事业部的ID
update template t set office_id = (select distinct office_id from platform_permission pp
    where pp.user_cd = t.created_by_id and pp.is_availability = 1)
where isnull(t.office_id);

-- 事业部的 name
update template t, (
    select pp.office_id, pp.office_name from platform_permission pp
    ) tmp set t.office_name = tmp.office_name
    where t.office_id = tmp.office_id;

-- 入库申请单
-- 事业部的ID
update stock_in_apply sia set office_id = (select distinct office_id from platform_permission pp
    where pp.user_cd = sia.created_by_id and pp.is_availability = 1)
where isnull(sia.office_id);

-- 事业部的 name
update stock_in_apply sia, (
    select pp.office_id, pp.office_name from platform_permission pp
    ) tmp set sia.office_name = tmp.office_name
    where sia.office_id = tmp.office_id;


-- 出库申请单的数据库刷入
-- 事业部的ID
update stock_out_apply soa set office_id = (select distinct office_id from platform_permission pp
    where pp.user_cd = soa.created_by_id and pp.is_availability = 1)
where isnull(soa.office_id);

-- 事业部的 name
update stock_out_apply soa, (
    select pp.office_id, pp.office_name from platform_permission pp
    ) tmp set soa.office_name = tmp.office_name
    where soa.office_id = tmp.office_id;



