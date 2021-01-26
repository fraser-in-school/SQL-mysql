-- 2021-01-06 需求变更, 核销统计增加四个查询字段, 两个查询条件
-- 在核销表上冗余出库类型的字段
alter table card_verification
    add out_style varchar(2) default null comment '出库类型：1市场活动领用（免费） 2对公售卖 3公关领用 4市场活动领用（售卖）';

-- 在核销表上冗余外部结算主体的字段
-- 并非所有出库的卡都有外部结算主体
alter table card.card_verification
    add out_close_account_org_id bigint(11) default null comment '外部结算主体的ID';

-- 在核销表上冗余付款方式
-- 不然查询核销的记录的付款方式需要多关联三张表
-- 跟外部结算主体是绑定的
alter table card_verification
    add pay_style varchar(2) default null comment '付款方式1: 渠道先付, 2: 渠道后付';


-- 增加 核销表从 platform 和 is_availability 的联合索引
create index idx_platform_is_availability
    on card_verification (platform, is_availability);


-- 将外部结算主体的ID刷入到核销表中
update card_verification cv, (
    select cv.id as id, cv.card_id, oso.id as out_close_account_org_id
    from card_verification cv
    inner join stock_out_apply_detail soad on cv.card_id = soad.card_id
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
    inner join outter_settlement_org oso on cg.online_product_channel = oso.code and cg.is_availability = 1
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


-- 增加一张 oa 账户和 userCd 的对应关系表
drop table  if exists oa_user;
create table oa_user (
    `id` bigint(11) auto_increment not null comment '主键id',
    `user_cd` varchar(100) default null comment '用户中心的userCd',
    `login_name` varchar(100) default null comment '用户中心的OA账户',
    PRIMARY KEY (`id`) USING BTREE
);

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
