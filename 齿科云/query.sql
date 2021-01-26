use card;
SELECT soa.created_by_name apply_name, soa.emp_no, soa.office_id, soa.office_name, soa.template_code, soa.settlement_org_id settlementOrgId, soa.settlement_org_name inner_close_account_org_name, soa.apply_number, soa.receiver_name, soa.receiver_phone, soa.out_style, soa.stock_id, soa.remarks, soae.outer_close_account_org_name, soae.invoice, soae.pay_style, t.id template_id, t.name template_name, outter.id outterSettlementOrgId, s.stock_available_number FROM stock_out_apply soa
    LEFT JOIN stock_out_apply_extends soae ON soae.apply_code = soa.apply_code
    LEFT JOIN template t ON t.code = soa.template_code
    LEFT JOIN outter_settlement_org outter ON outter.code = soae.outer_close_account_org_code
    LEFT JOIN stock s ON s.id = soa.stock_id
WHERE soa.id = 319 AND soa.platform = 'BB' AND soa.is_availability = 1

select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']') from rights_bybo_items where platform = 'BB' and right_id = 716 group by right_id union all select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']') from yk_rights_items where platform = 'YK' and right_id = 716 group by right_id

SET global group_concat_max_len=102400

select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']')
    from rights_bybo_items
where platform = 'BB' and right_id = 715 group by right_id
union all
select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']')
from yk_rights_items
where platform = 'YK' and right_id = 715 group by right_id

show full processlist;

select replace(group_concat(concat('KILL ',id,';')), ',', '') from information_schema.processlist
where user='card' and db = 'card' order by 1;
KILL 258469;KILL 258438;KILL 258461;KILL 258418;KILL 258477;KILL 258468;KILL 258478;KILL 258466;KILL 258470;KILL 258435;KILL 258463;KILL 258467;KILL 258465;KILL 258464;KILL 257174;KILL 258401;KILL 258462;

select concat('KILL ',id,';') from information_schema.processlist where user='card' order by 1;

KILL 247413;KILL 247412;KILL 247443;KILL 247472;KILL 247440;KILL 247441;KILL 247463;KILL 247459;KILL 247415;KILL 247439;KILL 247438;KILL 247469;KILL 247461;KILL 247444;KILL 247408;KILL 247070;KILL 247089;KILL 247470;KILL 247410;KILL 247409;KILL 247462;KILL 247362;KILL 247471;KILL 247416;KILL 247464;KILL 247436;KILL 247414;KILL 247442;KILL 247460;KILL 247377;KILL 247435;KILL 247411;KILL 247437;KILL 247417;KILL 247071;KILL 247473;

KILL 247436;KILL 247442;KILL 247435;KILL 247437;KILL 247483;KILL 247071;

select c.id as card_id, c.type as card_type, c.card_no, c.state as card_state, c.name as card_name, c.description as card_desc, c.apply_org, c.apply_org_name, c.used_group_code, c.actual_active_expiration, c.actual_use_expiration,
       c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_start_date,
       c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date,
       t.code as template_code, t.id as template_id, t.sale_price,
       c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
from card c
    inner join (select id, code, sale_price from template) t on c.template_id = t.id
    inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
    left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id

select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']') from rights_bybo_items where platform = 'BB' and right_id = 707 group by right_id union all select concat('[', group_concat(json_object('rightId', right_id, 'salePrice', round(sale_price / 100, 2), 'code', code, 'name', name, 'level', level)), ']') from yk_rights_items where platform = 'YK' and right_id = 707 group by right_id


select count(1) from card
    where platform = 'BB' and is_availability = 1
union all
select count(1) from stock_in_apply_detail
    where platform = 'BB' and is_availability = 1;
select * from stock_in_apply_detail siad where
-- 删除没有detail的card数据, 删除没有card的detail数据
delete from stock_in_apply_detail
    where card_id in
        (select siad.card_id from (select id as cid from card) c
    right join (select card_id from stock_in_apply_detail) siad on cid = siad.card_id
where isnull(cid));

select siad.card_id from card c
    right join stock_in_apply_detail siad on c.id = siad.card_id
where isnull(c.id)

select count(1) from card
    where platform = 'BB' and is_availability = 1
union all
select count(1) from stock_in_apply_detail
    where platform = 'BB' and is_availability = 1
union all
select count(1)
    from card c
        left join (select id, code, is_job_price from template) t on c.template_id = t.id
        inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
        left join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.is_availability = 1;

-- 删除没有模板的卡
select scpc.ID as id, scpc.STOCK_CONSUME_CODE as stock_consume_code, scpc.IF_MBLNR as sap_code, scpc.USE_TYPE as use_type, scpc.STATUS as status,
       cc.COST_CENTER_CODE as cost_center_code, cc.COST_CENTER_DESC as cost_center_desc
    from stock_care_product_consume scpc
    inner join stock_care_product_consume_detail scpcd on scpcd.STOCK_CARE_PRODUCT_CONSUME_ID = scpc.ID
    inner join material m on scpcd.MATERIAL_CODE = m.MATERIAL_CODE
    inner join cost_center cc on scpc.COST_CENTER_CODE = cc.COST_CENTER_CODE

select ID, MATERIAL_CODE from material
    where ID like '%49';

select verification_name, phone, verification_org_id, verification_org_name, out_close_account_org_id, right_id, pay_style, out_style, cv.created_time as created_time, marketing_manager, c.type as card_type, c.name as card_name, c.card_no, c.settlement_org_id as settlement_org_id, sale_price, cis.name as settlement_org_name, oso.name as out_close_account_org_name
from card_verification cv
    inner join card c on cv.card_id = c.id
    left join (select id, name, code from inner_settlement_org) cis on cis.id = c.settlement_org_id
    left join (select id, name, code from outter_settlement_org) oso on oso.id = cv.out_close_account_org_id
WHERE cv.out_close_account_org_id = 6 AND cv.platform = 'BB' AND cv.is_availability = 1
ORDER BY cv.updated_time DESC LIMIT 0,20


select id, MATERIAL_CODE, STOCK_RECEIVE_APPLY_ID, stock from stock_receive sr left join (
    select * from
                  (select STOCK_RECEIVE_ID, material_code, id as STOCK_RECEIVE_APPLY_ID, null as stock from stock_receive_apply_detail srad
                  union all
                  select STOCK_RECEIVE_ID, MATERIAL_CODE, STOCK_RECEIVE_APPLY_ID, id as stock_receive_detail_id from stock_receive_detail srd
                  ) right_table
    ) tmp on sr.id = tmp.STOCK_RECEIVE_ID
where id >= 55
order by id, STOCK_RECEIVE_APPLY_ID, stock


select oso.id from card c inner join card_get cg on cg.card_id = c.id left join outter_settlement_org oso on cg.online_product_channel = oso.code where c.id = 1207427

 select c.id as card_id, c.type as template_type, c.card_no, state,
                        c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date,
                        c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date,
                        t.code as template_code, t.id as template_id, t.is_job_price as is_job_price, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
                     from card c
                         inner join (select id, code, is_job_price from template) t on c.template_id = t.id
                         inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
                         inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
                 ${ew.customSqlSegment}

select c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date, c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date,
       -- t.code as template_code, t.id as template_id, t.is_job_price as is_job_price,
       c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name
from card c
    -- inner join (select id, code, is_job_price from template) t on c.template_id = t.id
    inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id
    inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE update_time  c.platform = 'BB' AND c.is_availability = 1
ORDER BY updated_time DESC
LIMIT 0,20

show variables like 'join_buffer_size';

drop index idx_updated_time on card;

create index idx_updated_time
	on card (updated_time desc);

select c.id as card_id, c.type as template_type, c.card_no, state, c.activation_period_type, c.activation_period, c.activation_unit, c.activation_start_date, c.activation_end_date, c.service_period_type, c.service_period, c.service_unit, c.service_start_date, c.service_end_date, t.code as template_code, t.id as template_id, t.is_job_price as is_job_price, c.name as templateName, sia.is_ecard, sia.settlement_org_id, sia.settlement_org_name from card c inner join (select id, code, is_job_price from template) t on c.template_id = t.id inner join (select card_id, apply_id from stock_in_apply_detail) siad on c.id = siad.card_id inner join (select id, is_ecard, settlement_org_id, settlement_org_name from stock_in_apply) sia on siad.apply_id = sia.id
WHERE c.platform = 'BB' AND c.is_availability = 1 AND c.updated_time >= '2021-01-11' ORDER BY updated_time DESC LIMIT 0,20


SELECT  id,STOCK_CONSUME_CODE,PERSON_INFO_ID,PERSON_INFO_NAME,PERNR,ORGANIZATION_CODE,ORGANIZATION_NAME,COST_CENTER_CODE,PRODUCT_TYPE,USE_TYPE,CHARGE_ORDER_ID,STATUS,PATIENT_NAME,REMARK,IF_REMBLNR,IF_MBLNR,is_availability,version,created_by_id,created_by_name,created_time,updated_by_id,updated_by_name,updated_time,platform  FROM stock_care_product_consume   scpc  WHERE ID = ? AND scpc.IS_AVAILABILITY = ?


SELECT  is_availability,STOCK_CARE_PRODUCT_CONSUME_ID,SUPPLIER_BATCH_NUMBER,SUPPLIER_CODE,SUPPLIER_NAME,AMOUNT,UNIT,UNIT_DESC,BATCH_NUMBER,CHARGE_ITEM_CODE,CHARGE_ITEM_NAME,DEDUCTION_EXECUTION_STEP_ID,STOCK_ADDRESS,STOCK_ADDRESS_DESC,FACTORY,FACTORY_DESC,MATERIAL_CODE,MATERIAL_DESC,MATERIAL_GROUP,LOCATION_TYPE,LOCATION_TYPE_DESC,STATUS,MANUFACTORE_DATE,EFFECTIVE_DATE,id,page_no,page_size,token,version,created_by_id,created_by_name,created_time,updated_by_id,updated_by_name,updated_time,platform  FROM stock_care_product_consume_detail     WHERE STOCK_CARE_PRODUCT_CONSUME_ID = ? AND s.IS_AVAILABILITY = ?


select scpc.ID as id, scpc.STOCK_CONSUME_CODE as stock_consume_code, scpc.IF_MBLNR as sap_code, scpc.USE_TYPE as use_type, scpc.STATUS as status
    ,cc.COST_CENTER_CODE as cost_center_code, cc.COST_CENTER_DESC as cost_center_desc
from stock_care_product_consume scpc
    left join cost_center cc on scpc.COST_CENTER_CODE = cc.COST_CENTER_CODE
WHERE scpc.IS_AVAILABILITY = 1 ORDER BY scpc.UPDATED_TIME DESC

SELECT id,MATERIAL_CODE,MATERIAL_DESC,MATERIAL_TYPE,MATERIAL_TYPE_DESC,MATERIAL_GROUP,MATERIAL_GROUP_DESC,MATERIAL_GROUP_DESC2,UNIT_CODE,UNIT_DESC,ORDER_UNIT_CODE,ORDER_UNIT_DESC,NUMERATOR,DENOMINATOR,GOODS_NAME,BRAND,SPECS,GOODS_MODEL,IS_BARGAIN,IS_HIGH_VALUE,CONTROL_TYPE,CONTROL_TYPE_DESC,BATCH_SWITCH,IS_DEL,STEP_FACTORY_STATUS,is_availability,version,created_by_id,created_by_name,created_time,updated_by_id,updated_by_name,updated_time,platform
    FROM material WHERE IS_AVAILABILITY = 1 AND MATERIAL_GROUP = 40600

 select scpc.ID as id, scpc.STOCK_CONSUME_CODE as stock_consume_code, scpc.IF_MBLNR as sap_code, scpc.USE_TYPE as use_type, scpc.STATUS as status     ,cc.COST_CENTER_CODE as cost_center_code, cc.COST_CENTER_DESC as cost_center_desc from stock_care_product_consume scpc     left join cost_center cc on scpc.COST_CENTER_CODE = cc.COST_CENTER_CODE WHERE scpc.IS_AVAILABILITY = 1 ORDER BY scpc.UPDATED_TIME DESC  WHERE scpc.IS_AVAILABILITY = ? ORDER BY scpc.UPDATED_TIME DESC