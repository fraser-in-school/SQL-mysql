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

-- base_rights 项目路径 SQL --
update base_rights br, (
    select br.id as id, replace(replace(concat('[', group_concat(concat('[', rbi.code, ']')), ']'), ',00', ''), '[]', '') as item_code_path
    from base_rights br
left join rights_bybo_items rbi on rbi.right_id = br.id
group by br.id
    ) tmp set br.item_code_path = tmp.item_code_path
where br.id = tmp.id and br.platform = 'BB';
-- End --