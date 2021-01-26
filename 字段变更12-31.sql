use card;
-- 增加是否为岗位优惠卡
ALTER TABLE template ADD is_job_price tinyint(1) DEFAULT 0 COMMENT '是否岗位优惠卡 0否 1是';

-- mysql count 优化, card 表冗余两个字段, count 的时候只 count总表
alter table card
	add is_job_price tinyint(1) default 0 null;

alter table card
	add settlement_org_id int null;

-- 增加两个索引
create index idx_is_job_price
	on card (is_job_price);

create index idx_settlement_org_id
	on card (settlement_org_id);

-- 增加 card 表从 platform 和 is_availability 的联合索引
create index idx_platform_is_availability
    on card (platform, is_availability);

-- 刷新 is_job_price 的字段
update card c set is_job_price = (select is_job_price from template t where c.template_id = t.id);
--  736983 rows affected in 37 s 705 ms

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

-- 刷新 settlement_org_id 的字段
update card c set settlement_org_id =
    (select settlement_org_id from stock_in_apply sia
        left join stock_in_apply_detail siad on sia.id = siad.apply_id
    where siad.card_id = c.id);
-- 736983 rows affected in 1 m 5 s 811 ms

-- settlement_org_id 刷入 stock 表中
update stock s set settlement_org_id = (
    select min(settlement_org_id) from card c
        where c.stock_id = s.id group by c.stock_id
    )