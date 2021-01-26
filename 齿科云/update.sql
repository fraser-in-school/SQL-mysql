update card_verification cv set out_close_account_org_id = null
    where id > 0

select card_id, group_concat(oso.id) from card_get cg
    inner join outter_settlement_org oso on cg.online_product_channel = oso.code and cg.is_availability = 1
    group by cg.card_id having count(oso.id) > 1

select code, group_concat(id), group_concat(name) from outter_settlement_org_new
 group by code having count(id) > 1


update card_verification cv set out_close_account_org_id = (
    select oso.id from card_get cg
    inner join (select code, min(id) as id from outter_settlement_org group by code) oso on cg.online_product_channel = oso.code and cg.is_availability = 1
    where cg.card_id = cv.card_id
    ) where out_style = '5';

SELECT * FROM information_schema.columns WHERE column_comment LIKE '%外部%' and TABLE_SCHEMA = 'card';

load data local infile 'C:\Users\zhanghao88\文档\SQL\oa-userinfo.csv' into table oa_user character set utf8 fields terminated by ','  optionally enclosed by '"' escaped by '"'   lines terminated by '\r\n';

select * from outter_settlement_org
                        where instr(
                            concat(',', '7,8,9', ','), concat(',', id, ',')
                                  )