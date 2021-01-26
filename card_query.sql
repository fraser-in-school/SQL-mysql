use card;

select * from office o where id = (
    select settlement_org_id
    from stock_in_apply sia
    where sia.id = (
        select apply_id
        from stock_in_apply_detail siad
        where card_id = (
            select id
            from card
            where card_no = 'BBZH2009020rR7E'
        )
    )
);

select * from office o where id = (
    select settlement_org_id from stock_in_apply sia where sia.id = (
        select apply_id from stock_in_apply_detail siad where card_id = (
            select id from card WHERE id = ? ) ));

select * from card_get where wx_active_code = 'active_Code';

select cv.*, c.type as card_type, sum(br.quota + br.base) as total_amount,
       br.rights_type as rights_type from card_verification cv
    left join card c on c.id= cv.card_id
    left join base_rights  br on cv.right_id = br.id ;

select cv.*, c.type as card_type, br.base, br.quota,
       br.rights_type as rights_type
from card c
    left join card_verification cv on c.id= cv.card_id
    left join base_rights br on cv.right_id = br.id
WHERE c.id = 37471;


select sum(settlement_price) from card_verification where card_id = 37888;

select sia.*,t.code as template_code, t.name as template_name,t.type as template_type,
       siaa.updated_time as audit_time, siaa.updated_by_name as audit_by_name,
       siaa.reason as reason from stock_in_apply sia
           left join template t on sia.template_id = t.id
           left join stock_in_auto_apply_audit siaa on siaa.apply_id=sia.id
WHERE sia.platform = 'BB' AND sia.state = '1' AND sia.type = '2' ORDER BY sia.created_time DESC LIMIT 0,15;

select * from card where card_no = 'BBZH2009053MLMW';

select * from (select tr.template_id, min(s.id) as stock_id, min(stock_mode) as stock_mode, min(t.code) as template_code, min(t.name) as card_name, min(t.type) as card_type, min(t.description) as card_use_desc, min(t.platform) as platfrom, min(t.created_time) as created_time, min(base) as base, min(quota) as quota, min(total_number) as right_total_number, min(is_job_price) as is_job_price from
    template t
        left join template_rights tr on t.id = tr.template_id
        left join base_rights br on tr.right_id = br.id
        left join stock s on t.id = s.template_id
where ((type = '1' and total_number = 1) or type = '2') and t.sale_price = 0 and s.stock_mode = '2'
    group by tr.template_id having count(tr.template_id) = 1
union all
select t.id as template_id, s.id as stock_id, stock_mode as stock_mode, t.code as template_code, t.name as card_name, t.type as card_type, t.description as card_use_desc, t.platform as platform, t.created_time, null, null, null, is_job_price as is_job_price
from template t
    left join stock s on t.id = s.template_id
where type = '4' and t.sale_price = 0 and s.stock_mode = '2' and
      exists (     select * from template_rights tr where t.id = tr.template_id     )
    )
    template_base_info
WHERE platfrom = 'BB'  ORDER BY created_time DESC