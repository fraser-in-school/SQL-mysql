alter table stock_care_product_consume
    modify CREATED_BY_ID varchar(255) not null comment '创建人的oa账户';
alter table stock_care_product_consume
    modify UPDATED_BY_ID varchar(255) not null comment '更新人的oa账户';
alter table stock_care_product_consume_detail
    modify CREATED_BY_ID varchar(255) not null  comment '创建人的oa账户';
alter table stock_care_product_consume_detail
    modify UPDATED_BY_ID varchar(255) not null comment '更新人的oa账户';

alter table stock_receive
    modify CREATED_BY_ID varchar(255)  comment '创建人的oa账户';
alter table stock_receive
    modify UPDATED_BY_ID varchar(255)  comment '更新人的oa账户';

alter table stock_receive_apply_detail
    modify CREATED_BY_ID varchar(255)  comment '创建人的oa账户';
alter table stock_receive_apply_detail
    modify UPDATED_BY_ID varchar(255)  comment '更新人的oa账户';

alter table stock_receive_detail
    modify CREATED_BY_ID varchar(255)  comment '创建人的oa账户';
alter table stock_receive_detail
    modify UPDATED_BY_ID varchar(255)  comment '更新人的oa账户';

alter table stock_care_product_consume
    add ORGANIZATION_RELATION_ID bigint(20) default -1 comment '组织关系的ID';
