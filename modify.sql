select right_id, code, name, level, sale_price from card.rights_bybo_items
    where platform = 'BB' and right_id = 707
union all
select right_id, code, name, level, sale_price from card.yk_rights_items
    where platform = 'YK' and right_id = 707

alter table template
        add online_retailers_id varchar(1000) null comment '电商渠道的ID, 引用的是外部结算主体的表, 可以多选, 多个时用逗号分隔开';

alter table template modify online_retailers_code varchar(2550) null comment '电商渠道的code, 可多选, 多选时用逗号分隔开';

alter table template modify online_retailers_name varchar(2550) null comment '电商渠道的name';

insert into card(name, description, type, activation_period_type, activation_start_date, activation_end_date, activation_period, activation_unit, service_period_type, service_start_date, service_end_date, service_period, service_unit, sale_price, actual_active_expiration, actual_use_expiration, state, card_no, password, apply_org, apply_org_name, template_id, stock_id, is_availability, version, created_by_id, created_by_name, created_time, updated_by_id, updated_by_name, updated_time, platform