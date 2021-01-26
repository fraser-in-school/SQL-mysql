use card_dev;

select * from office o where id = (
    select settlement_org_id from stock_in_apply sia where sia.id = (
        select apply_id from stock_in_apply_detail siad where card_id = (
            37471
            )
        ));

select * from office o where id = (
    select settlement_org_id from stock_in_apply sia where sia.id = (
        select apply_id from stock_in_apply_detail siad where card_id = (
            select id from card WHERE id = 37471 ) ));

select * from office o where id = ( select settlement_org_id from stock_in_apply sia where sia.id = ( select apply_id from stock_in_apply_detail siad where card_id = ( select id from card WHERE id = 37471 ) ));

select count(1) from card c WHERE c.platform = 'BB' AND c.settlement_org_id = 25 AND c.is_availability = 1;

select c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period,
       c.activation_unit, c.activation_start_date, c.activation_end_date,
       c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date,
       t.code as template_code, t.id as template_id, t.is_job_price as is_job_price, c.name as templateName,
       sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
    from card c
        inner join (select id, code, is_job_price from template) t on c.template_id = t.id
        inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
        inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB'  AND c.is_availability = 1 AND c.settlement_org_id = 25 ORDER BY updated_time DESC LIMIT 0,20;

--  查看计数
select count(1)-- c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date, c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date, t.code as template_code, t.id as template_id, t.is_job_price as is_job_price, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
    from card c
        inner join (select id, code, is_job_price from template) t on c.template_id = t.id
        inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
        left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.settlement_org_id = 25 AND c.is_availability = 1  ORDER BY updated_time DESC -- LIMIT 0,20;

-- 查看card表有多少 settlement_org_id 为null的

select count(1) from card
    where isnull(settlement_org_id) = 1;
-- update card settlement_org_id
update card set settlement_org_id = 29
    where isnull(settlement_org_id) = 1;

--
reset query cache;
select c.id as card_id, c.type as template_type, c.card_no, state,
       c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date,
       c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date,
       t.code as template_code, t.id as template_id, t.is_job_price as is_job_price, c.name as templateName,
       sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
    from card c
        inner join (select id, code, is_job_price from template) t on c.template_id = t.id
        inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
        inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.settlement_org_id = 25 AND c.is_availability = 1  ORDER BY updated_time DESC LIMIT 0,20;

-- 服务器
select c.id as card_id, c.type as template_type, c.card_no, state,
       c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date,
       c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date,
       t.code as template_code, t.id as template_id, t.is_job_price as is_job_price, c.name as templateName,
       sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
from card c
    inner join (select id, code, is_job_price from template) t on c.template_id = t.id
    inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
    inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id

select count(1) from card c
WHERE c.platform = 'BB' AND c.is_availability = 1 AND c.settlement_org_id = 25 ORDER BY updated_time DESC LIMIT 0,20;