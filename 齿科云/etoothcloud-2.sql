create table appointment
(
    VERSION            int           null comment '乐观锁,版本号',
    CREATED_TIME       datetime      null comment '创建时间',
    CREATED_BY_ID      bigint        null comment '创建人',
    CREATED_BY_NAME    varchar(256)  null comment '创建人名称',
    UPDATED_TIME       datetime      null comment '更新时间',
    UPDATED_BY_ID      bigint        null comment '更新人',
    UPDATED_BY_NAME    varchar(256)  null comment '更新人名称',
    IS_AVAILABILITY    int           null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM           varchar(5)    null comment '平台 平台：1、拜博；2、养康',
    ID                 int           not null comment 'ID'
        primary key,
    HIS_ID             int           null comment 'HIS系统ID',
    PATIENT_ID         int           null comment '患者 Id',
    START_TIME         datetime      null comment '开始时间',
    END_TIME           datetime      null comment '结束时间',
    OPERATORY_ID       int           null comment '诊室 Id',
    DOCTOR_ID          int           null comment '医生 Id',
    ASSISTANT_ID       int           null comment '护士 Id',
    CONSULTANT_ID      int           null comment '咨询师 Id',
    DEPARTMENT         varchar(60)   null comment '科室',
    NOTES              varchar(3072) null comment '备注',
    IS_CANCELLED       int           null comment '是否已取消',
    IS_CONFIRMED       int           null comment '是否已确认',
    IS_CHECKED_IN      int           null comment '是否已挂号',
    IS_SEATED          int           null comment '是否开始治疗',
    IS_COMPLETED       int           null comment '是否完成治疗',
    IS_CHECKED_OUT     int           null comment '是否已结账',
    IS_FAILED          int           null comment '是否失约',
    IS_LEFT            int           null comment '是否已离开',
    IS_CONSULTING      int           null comment '是否已咨询',
    IS_REMIND_EXCLUED  int           null comment '是否不需要提醒',
    IS_REMINDED        int           null comment '是否已提醒',
    IS_FOLLOWUPED      int           null comment '是否已随访',
    IS_PENDING         int           null comment '是否是待定预约',
    STATE_LAST_UPDATED datetime      null comment '状态上次更新时间',
    IS_FIRST_VISIT     int           null comment '是否初诊',
    SOURCE_TYPE        varchar(30)   null comment '预约渠道',
    CHECK_IN_TYPE      varchar(60)   null comment '挂号类型',
    HAS_TRANSFERRED    int           null comment '已否已转诊',
    CHECK_IN_NO        int           null comment '挂号流水号',
    VISIT_SEQ_NO       int           null comment '患者到店序号',
    FROM_APP_ID        int           null comment '转诊的来源预约 Id',
    APPOINTMENT_TYPE   int           null comment '预约类型',
    CONFIRM_TYPE       int           null comment '确认类型',
    CONSULT_ITEM       varchar(256)  null comment '咨询项目',
    OFFICE_ID          int           null comment '组织机构ID',
    TENANT_ID          varchar(40)   null comment '租户ID'
)
    comment '预约表';

create table charge_deduction_execution
(
    VERSION         int            null comment '乐观锁,版本号',
    CREATED_TIME    datetime       null comment '创建时间',
    CREATED_BY_ID   bigint         null comment '创建人',
    CREATED_BY_NAME varchar(256)   null comment '创建人名称',
    UPDATED_TIME    datetime       null comment '更新时间',
    UPDATED_BY_ID   bigint         null comment '更新人',
    UPDATED_BY_NAME varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM        varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID              int            not null comment 'ID'
        primary key,
    HIS_ID          int            null comment 'HIS系统ID',
    OFFICE_ID       int            null comment '组织机构ID',
    TENANT_ID       varchar(40)    null comment '租户ID',
    CHARGE_ORDER_ID int            null comment '收费单 Id(HIS)',
    TOTAL_PRICE     decimal(32, 8) null comment '划扣总金额',
    DEDUCTED_PRICE  decimal(32, 8) null comment '划扣已执行金额',
    PATIENT_ID      int            null comment '所属病人 Id',
    CREATOR_ID      int            null comment '创建者 Id',
    CREATOR_NAME    varchar(60)    null comment '创建者姓名'
)
    comment '划扣执行表';

create table charge_deduction_execution_step
(
    VERSION                int            null comment '乐观锁,版本号',
    CREATED_TIME           datetime       null comment '创建时间',
    CREATED_BY_ID          bigint         null comment '创建人',
    CREATED_BY_NAME        varchar(256)   null comment '创建人名称',
    UPDATED_TIME           datetime       null comment '更新时间',
    UPDATED_BY_ID          bigint         null comment '更新人',
    UPDATED_BY_NAME        varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY        int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM               varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                     int auto_increment comment 'ID'
        primary key,
    HIS_ID                 int            null comment '划扣执行步骤ID，HIS系统ID',
    OFFICE_ID              int            null comment '组织机构ID',
    TENANT_ID              varchar(40)    null comment '租户ID',
    CHARGE_ORDER_ID        int            null comment '收费单 Id(HIS)',
    CHARGE_ORDER_DETAILID  int            null comment '关联的收费明细项 Id',
    EXECUTION_ID           int            null comment '关联的划扣执行 Id',
    CHARGE_ITEM_NAME       varchar(256)   null comment '收费项目名称',
    PLAN_NAME              varchar(60)    null comment '划扣方案名称',
    STEP_NAME              varchar(60)    null comment '划扣步骤名称',
    ITEM_STEP_CODE         varchar(60)    null comment '项目划扣步骤编码',
    STEP_RATIO             decimal(10, 2) null comment '划扣步骤在其所属方案中所占的比 例',
    STEP_PRICE             decimal(32, 8) null comment '划扣步骤的金额',
    STATE                  int            null comment '划扣步骤执行状态 0:Pending
未执行
1:Executed
已执行
2:Aborted
划扣步骤提
前结束，剩
下的步骤状
态为已终止
3:Skipped
已跳过',
    WORKFLOW_STATUS        int            null comment '划扣步骤审批状态',
    EXECUTION_TIME         datetime       null comment '划扣步骤的执行时间',
    EXECUTION_OFFICE_ID    int            null comment '该步骤执行的诊所 Id',
    PLAN_STEP_ID           int            null comment '来源的划扣方案步骤 Id',
    STEP_INDEX             int            null comment '划扣步骤执行顺序',
    MAN_HOUR_COUNT         int            null comment '划扣步骤花费工时',
    IS_REPEATABLE          int            null comment '是否是重复执行步骤',
    REPEAT_INDEX           int            null comment '重复执行的 Index',
    IS_DEFAULT_REPEAT_STEP int            null comment '是否是默认生成的重复执行步骤',
    IS_ALLOW_SKIP          int            null comment '是否可以跳过此步骤',
    IS_NEED_APPROVE        int            null comment '是否参与审批',
    IS_AUTO_EXECUTE        int            null comment '是否自动执行',
    ORIGIN_STEP_RATIO      decimal(10, 2) null comment '划扣步骤占所属方案比例'
)
    comment '划扣执行步骤表';

create table charge_deduction_execution_step_product
(
    VERSION           int          null comment '乐观锁,版本号',
    CREATED_TIME      datetime     null comment '创建时间',
    CREATED_BY_ID     bigint       null comment '创建人',
    CREATED_BY_NAME   varchar(256) null comment '创建人名称',
    UPDATED_TIME      datetime     null comment '更新时间',
    UPDATED_BY_ID     bigint       null comment '更新人',
    UPDATED_BY_NAME   varchar(256) null comment '更新人名称',
    IS_AVAILABILITY   int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM          varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                int auto_increment comment 'ID'
        primary key,
    HIS_ID            int          null comment '划扣执行步骤ID，HIS系统ID',
    OFFICE_ID         int          null comment '组织机构ID',
    TENANT_ID         varchar(40)  null comment '租户ID',
    EXECUTION_ID      int          null comment '划扣执行 Id(HIS)',
    EXECUTION_STEP_ID int          null comment '划扣执行步骤 Id(HIS)',
    PRODUCT_ID        int          null comment '关联的物品 ID',
    COUNT             int          null comment '本次划扣执行消耗的物品数量'
)
    comment '划扣执行步骤关联出库的物品表';

create table charge_item
(
    VERSION                  int                    null comment '乐观锁,版本号',
    CREATED_TIME             datetime               null comment '创建时间',
    CREATED_BY_ID            bigint                 null comment '创建人',
    CREATED_BY_NAME          varchar(256)           null comment '创建人名称',
    UPDATED_TIME             datetime               null comment '更新时间',
    UPDATED_BY_ID            bigint                 null comment '更新人',
    UPDATED_BY_NAME          varchar(256)           null comment '更新人名称',
    IS_AVAILABILITY          int                    null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                 varchar(5)             null comment '平台 平台：1、拜博；2、养康',
    ID                       int                    not null comment 'ID'
        primary key,
    HIS_ID                   int                    null comment 'HIS系统ID',
    ITEM_NAME                varchar(512)           null comment '项目名称',
    ITEM_CODE                varchar(32)            null comment '编码',
    ITEM_ENGLISH_NAME        varchar(512)           null comment '项目英文名称',
    PINYIN                   varchar(512)           null comment '拼音',
    UNIT                     varchar(20)            null comment '单位',
    PRICE                    decimal(32, 8)         null comment '单价',
    ITEM_CATAGORY_ID         int                    null comment '所属小类 Id',
    ITEM_CATAGORY_NAME       varchar(256)           null comment '所属小类名称',
    ITEM_SUPER_CATEGORY_ID   int                    null comment '所属大类 Id',
    ITEM_SUPER_CATEGORY_NAME varchar(256)           null comment '所属大类名称',
    OFFICE_ID                int                    null comment '组织ID',
    TENANTID                 varchar(40)            null comment '租户ID',
    RECORD_CREATED_TIME      datetime               null comment '创建时间',
    RECORD_UPDATED_TIME      datetime               null comment '修改时间',
    ISINACTIVE               varchar(5)             null comment '是否有效 0有效1失效',
    ALLOW_DISCOUNT           int                    null comment '是否允许单项打折',
    ALLOW_ORDER_DISCOUNT     int                    null comment '是否允许整单打折',
    DISPLAY_ORDER            int                    null comment '显示顺序',
    PROCEDURE_CODE           varchar(60)            null comment '项目编码（误用的）',
    ITEM_SUB_CATEGORY        varchar(30)            null comment '项目相关的费用类型',
    IS_DEDUCTION_ENABLED     int                    null comment '是否启用划扣',
    IS_AUTO_DEDUCT           int                    null comment '是否自动划扣',
    IS_DISABLED              int                    null comment '是否禁用',
    SCENARIO                 int                    null comment '收费场景 0:Default 普通收费
1:WechatMall 微商城收费
2:AdvancePayment 预付款（储值
卡）收费
3:GiftCertificate_Discount
折扣卡券售卖
4:GiftCertificate_Combo 套餐
卡券售卖
5:GiftCertificate_CashCoupon 现金卡券售卖
6:DentalLab 技加工收费',
    CHARGE_DEDUCTION_PLAN_ID int                    null comment '关联的划扣方案 Id',
    SYNC_SOURCE_ID           int                    null comment '上级原记录 Id 从上级 office 中 copy 过来的原记录 Id， 默认为 0，表示本诊所的数据',
    CHARGE_ITEM_TYPE         int                    null comment '项目类型 0:Service 服务类收费项目
1:Product 物品类收费项目
2:DentalLab 技加工类收费项目',
    PRODUCT_ID               int                    null comment '关联的物品 Id',
    IS_IN_DEAL               varchar(5) default '1' null comment '是否属于成交类收费项目',
    MAX_PRICE                decimal(32, 8)         null comment '最大单价',
    MIN_PRICE                decimal(32, 8)         null comment '最小单价',
    MIN_DISCOUNT             varchar(32)            null comment '最小折扣'
)
    comment '处置项明细收费项目';

create table charge_item_category
(
    VERSION                  int                    null comment '乐观锁,版本号',
    CREATED_TIME             datetime               null comment '创建时间',
    CREATED_BY_ID            bigint                 null comment '创建人',
    CREATED_BY_NAME          varchar(256)           null comment '创建人名称',
    UPDATED_TIME             datetime               null comment '更新时间',
    UPDATED_BY_ID            bigint                 null comment '更新人',
    UPDATED_BY_NAME          varchar(256)           null comment '更新人名称',
    IS_AVAILABILITY          int                    null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                 varchar(5)             null comment '平台 平台：1、拜博；2、养康',
    ID                       int                    not null comment 'ID'
        primary key,
    HIS_ID                   int                    null comment 'HIS系统ID',
    ITEM_NAME                varchar(512)           null comment '项目名称',
    ITEM_CODE                varchar(30)            null comment '编码',
    PINYIN                   varchar(512)           null comment '拼音',
    DISPLAY_ORDER            int                    null comment '显示顺序',
    ITEM_SUPER_CATEGORY_ID   int                    null comment '所属大类 Id',
    ITEM_SUPER_CATEGORY_NAME varchar(256)           null comment '所属大类名称',
    OFFICE_ID                int                    null comment '组织机构ID',
    TENANT_ID                varchar(40)            null comment '租户ID',
    RECORD_CREATED_TIME      datetime               null comment '创建时间',
    RECORD_UPDATED_TIME      datetime               null comment '修改时间',
    ISINACTIVE               varchar(5)             null comment '是否有效 0有效1失效',
    ITEM_ENGLISH_NAME        varchar(512)           null comment '项目英文名称',
    SYNC_SOURCE_ID           int                    null comment '上级原记录 Id 从上级 office 中 copy 过来的原记录 Id，默认为 0， 表示本诊所的数据',
    IS_IN_DEAL               varchar(5) default '1' null comment '是否属于成交类收费项目'
)
    comment '处置项收费小类';

create table charge_item_super_category
(
    VERSION             int          null comment '乐观锁,版本号',
    CREATED_TIME        datetime     null comment '创建时间',
    CREATED_BY_ID       bigint       null comment '创建人',
    CREATED_BY_NAME     varchar(256) null comment '创建人名称',
    UPDATED_TIME        datetime     null comment '更新时间',
    UPDATED_BY_ID       bigint       null comment '更新人',
    UPDATED_BY_NAME     varchar(256) null comment '更新人名称',
    IS_AVAILABILITY     int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM            varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                  int          not null comment 'ID'
        primary key,
    HIS_ID              int          null comment 'HIS系统ID',
    ITEM_NAME           varchar(512) null comment '项目名称',
    ITEM_ENGLISH_NAME   varchar(512) null comment '项目英文名称',
    ITEM_CODE           varchar(30)  null comment '编码',
    PINYIN              varchar(512) null comment '拼音',
    DISPLAY_ORDER       int          null comment '显示顺序',
    OFFICE_ID           int          null comment '组织ID',
    TENANTID            varchar(40)  null comment '租户ID',
    RECORD_CREATED_TIME datetime     null comment '创建时间',
    RECORD_UPDATED_TIME datetime     null comment '修改时间',
    ISINACTIVE          varchar(5)   null comment '是否有效 0有效1失效',
    CATEGORY_TYPE       varchar(5)   null comment '收费大类类型 0:Default
1:Shangbao
2:Yibao
3:DentalLab',
    SYNC_SOURCE_ID      int          null comment '上级原记录 Id 从上级 office 中 copy 过来的原记录 Id， 默认为 0，表示本诊所的数据'
)
    comment '处置项收费大类';

create table charge_order
(
    VERSION                     int            null comment '乐观锁,版本号',
    CREATED_TIME                datetime       null comment '创建时间',
    CREATED_BY_ID               bigint         null comment '创建人',
    CREATED_BY_NAME             varchar(256)   null comment '创建人名称',
    UPDATED_TIME                datetime       null comment '更新时间',
    UPDATED_BY_ID               bigint         null comment '更新人',
    UPDATED_BY_NAME             varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY             int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                    varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                          int auto_increment comment 'ID'
        primary key,
    HIS_ID                      int            null comment '收费单ID，HIS系统ID',
    OFFICE_ID                   int            null comment '组织机构ID',
    TENANT_ID                   varchar(40)    null comment '租户ID',
    APPOINTMENT_ID              int            null comment '预约 Id',
    PATIENT_ID                  int            null comment '患者 Id',
    STATUS                      varchar(20)    null comment '状态 已收费，未 收费，已作废，退 费，部分退费',
    TOTAL_PRICE                 decimal(32, 8) null comment '应用单项折扣之 后的本次折前费 用',
    PLAN_PRICE                  decimal(32, 8) null comment '应用单项折扣之 后的本单折前应 收(目前含义与 TotalPrice 相 同)',
    ACTUAL_PRICE                decimal(32, 8) null comment '总实收费用',
    OVERDUE                     decimal(32, 8) null comment '本次欠费',
    DISCOUNT                    decimal(10, 2) null comment '折扣率',
    DISCOUNT_PRICE              decimal(32, 8) null comment '整单折扣掉的价 格',
    PAY_TYPE                    varchar(50)    null comment '付款方式 1',
    ACTUAL_PRICE1               decimal(32, 8) null comment '付款方式 1 的实 收',
    PAY_TYPE2                   varchar(50)    null comment '付款方式 2',
    ACTUAL_PRICE2               decimal(32, 8) null comment '付款方式 2 的实 收',
    PAY_TYPE3                   varchar(50)    null comment '付款方式 3',
    ACTUAL_PRICE3               decimal(32, 8) null comment '付款方式 3 的实 收',
    PAYEE_ID                    int            null comment '收款人 Id',
    PAYEE                       varchar(30)    null comment '收款人名字',
    PAY_DATETIME                datetime       null comment '收款时间',
    COMMENTS                    varchar(256)   null comment '备注',
    ORDER_TYPE                  varchar(60)    null comment '收费单类型',
    BILL_NO                     varchar(50)    null comment '账单流水号',
    PAY_OFFICE_ID               int            null comment '收费诊所 Id',
    SOURCE_CHARGE_ORDER_ID      int            null comment '收费原单 ID',
    FEE_TYPE                    int            null comment '收费类型 0:Charge 收费
1:Refund 退费
2:Overdue 还欠费
3:PartRefund 部分退费
4:Abort 作废
5:BatchOverdue 合并还欠款
6:AbortAndRevert 作废并撤回
7:TransferIn 转入
8:TransferOut 转出',
    FEE_SUB_TYPE                int            null comment '收费子类型 0:Unknown 未知
1:RefundItem 退项目
2:RefundPrice 退金额
3:RefundOrder 退整单
4:RefundYibao 退医保
5:RefundStep 退步骤
6:RefundYitizhifu 一体支付退
费',
    CHANNEL                     int            null comment '销售渠道 0:Unknown 未知
1:Web 网站前端
2:App 手机 App
3:WechatMall 微商城',
    SCENARIO                    int            null comment '收费场景 0:Default 普通收费
1:WechatMall 微商城收费
2:AdvancePayment 预付款（储值
卡）收费
3:GiftCertificate_Discount
折扣卡券售卖
4:GiftCertificate_Combo 套餐
卡券售卖
5:GiftCertificate_CashCoupon
现金卡券售卖
6:DentalLab 技加工收费',
    IS_HANDLE                   int            null comment '是否是处置',
    IS_ALIPAY_ORDER             int            null comment '是否为支付宝收费',
    IS_PAY_OVERDUE              int            null comment '是否为还欠款模 式',
    IS_ARCHIVED                 int            null comment '是否是补录收费',
    NOT_USE_MEMBERSHIP_DISCOUNT int            null comment '是否归档',
    FROM_CHARGE_ORDER_ID        int            null comment '关联收费单 Id',
    IS_SELF_CANCELLED           int            null comment '是否是本单作废',
    REASON                      varchar(512)   null comment '原因'
)
    comment '收费单表';

create table charge_order_detail
(
    VERSION              int            null comment '乐观锁,版本号',
    CREATED_TIME         datetime       null comment '创建时间',
    CREATED_BY_ID        bigint         null comment '创建人',
    CREATED_BY_NAME      varchar(256)   null comment '创建人名称',
    UPDATED_TIME         datetime       null comment '更新时间',
    UPDATED_BY_ID        bigint         null comment '更新人',
    UPDATED_BY_NAME      varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY      int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM             varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                   int auto_increment comment 'ID'
        primary key,
    HIS_ID               int            null comment '收费单明细ID，HIS系统ID',
    OFFICE_ID            int            null comment '组织机构ID',
    TENANT_ID            varchar(40)    null comment '租户ID',
    HIS_CHARGE_ORDER_ID  int            null comment '收费单 Id(HIS)',
    CHARGE_ITEM_ID       int            null comment '收费项目 Id',
    ITEM_NAME            varchar(512)   null comment '项目名称',
    ITEM_TYPE            varchar(256)   null comment '小类名称',
    ITEM_SUPER_TYPE      varchar(256)   null comment '大类名称',
    COUNT                decimal(10, 2) null comment '项目数量',
    UNIT                 varchar(20)    null comment '项目单位',
    PRICE                decimal(32, 8) null comment '项目单价',
    TOTAL_PRICE          decimal(32, 8) null comment '单项折扣后总应收',
    PLAN_PRICE           decimal(32, 8) null comment '应用单项和整单折扣后的总应收',
    ACTUAL_PRICE         decimal(32, 8) null comment '项目实收',
    OVERDUE              decimal(32, 8) null comment '项目欠费',
    ALLOW_DISCOUNT       int            null comment '是否参与单项折扣并允许手工修改折扣',
    ALLOW_ORDER_DISCOUNT int            null comment '是否参与整单折扣',
    DISCOUNT             decimal(10, 2) null comment '项目折扣率',
    DISCOUNT_PRICE       decimal(32, 8) null comment '项目折扣掉的总金额',
    DEPARTMENT           varchar(60)    null comment '科室',
    FDITOOTH_CODES       varchar(256)   null comment '牙位',
    NOTES                varchar(512)   null comment '备注',
    IS_GIFT              int            null comment '是否是会员馈赠项目',
    IS_REIMBURSE         int            null comment '该项目是否全部退掉',
    DOCTOR_ID            int            null comment '绩效医生 Id',
    DOCTOR_NAME          varchar(512)   null comment '绩效医生姓名',
    NURSE_ID             int            null comment '绩效护士 Id',
    NURSE_NAME           varchar(512)   null comment '绩效护士姓名',
    CONSULTANT_ID        int            null comment '绩效咨询师 Id',
    CONSULTANT_NAME      varchar(512)   null comment '绩效咨询师姓名',
    EXTRA_PROVIDER_ID    int            null comment '附加员工 Id',
    SELLER_ID            int            null comment '销售员工 Id',
    STEP_NAME            varchar(60)    null comment '收费项分步骤执行是的步骤名称',
    DEDUCTION_CODE       varchar(20)    null comment '划扣项目编码',
    PRODUCT_ID           int            null comment '关联的物品 Id',
    IS_DEALT             int            null comment '是否成交',
    SOURCE_DETAIL_ID     int            null comment '源明细 Id',
    CHARGE_ORDER_ID      int            null comment '收费单ID'
)
    comment '收费单明细项目表';

create table cost_center
(
    VERSION          int          null comment '乐观锁,版本号',
    CREATED_TIME     datetime     null comment '创建时间',
    CREATED_BY_ID    bigint       null comment '创建人',
    CREATED_BY_NAME  varchar(256) null comment '创建人名称',
    UPDATED_TIME     datetime     null comment '更新时间',
    UPDATED_BY_ID    bigint       null comment '更新人',
    UPDATED_BY_NAME  varchar(256) null comment '更新人名称',
    IS_AVAILABILITY  int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM         varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID               int auto_increment comment 'ID'
        primary key,
    COMPANY_CODE     varchar(5)   null comment '公司代码 IF_BUKRS',
    COST_CENTER_CODE varchar(10)  null comment '成本中心 IF_KOSTL',
    COST_CENTER_DESC varchar(20)  null comment '成本中心描述 IF_KTEXT',
    MANAGER          varchar(20)  null comment '负责人 IF_VERAK',
    FUNCTION_SCOPE   varchar(20)  null comment '功能范围 IF_FKBER，'
)
    comment '成本中心SAP';

create table material
(
    VERSION              int          null comment '乐观锁,版本号',
    CREATED_TIME         datetime     null comment '创建时间',
    CREATED_BY_ID        bigint       null comment '创建人',
    CREATED_BY_NAME      varchar(256) null comment '创建人名称',
    UPDATED_TIME         datetime     null comment '更新时间',
    UPDATED_BY_ID        bigint       null comment '更新人',
    UPDATED_BY_NAME      varchar(256) null comment '更新人名称',
    IS_AVAILABILITY      int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM             varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                   int auto_increment comment '主键ID'
        primary key,
    MATERIAL_CODE        varchar(40)  null comment '物料编码 IF_MATNR',
    MATERIAL_DESC        varchar(40)  null comment '物料描述 IF_MAKTX',
    MATERIAL_TYPE        varchar(5)   null comment '物料类型 IF_MTART',
    MATERIAL_TYPE_DESC   varchar(25)  null comment '物料类型描述 IF_MTBEZ',
    MATERIAL_GROUP       varchar(10)  null comment '物料组 IF_MATKL  40600护理品物料组',
    MATERIAL_GROUP_DESC  varchar(20)  null comment '物料组描述 IF_WGBEZ',
    MATERIAL_GROUP_DESC2 varchar(20)  null comment '物料组描述2 IF_WGBEZ60',
    UNIT_CODE            varchar(5)   null comment '基本计量单位代码 IF_MEINS',
    UNIT_DESC            varchar(30)  null comment '基本计量单位描述 IF_MSEHL',
    ORDER_UNIT_CODE      varchar(5)   null comment '订单单位代码 IF_BSTME',
    ORDER_UNIT_DESC      varchar(30)  null comment '订单单位描述 IF_ZMSEHL',
    NUMERATOR            varchar(5)   null comment '基本计量单位转换分子 IF_UMREZ   MARM-MEINH=MARA-BSTME',
    DENOMINATOR          varchar(5)   null comment '转换为基本计量单位的分母 IF_UMREN',
    GOODS_NAME           varchar(50)  null comment '商品名称 IF_SPM',
    BRAND                varchar(20)  null comment '品牌 IF_ZPINP',
    SPECS                varchar(50)  null comment '规格 IF_GG',
    GOODS_MODEL          varchar(30)  null comment '型号 IF_XH',
    IS_BARGAIN           char         null comment '是否划扣耗材 IF_ZHKBS    X或空，X为划扣',
    IS_HIGH_VALUE        char         null comment '高低值 IF_ZGZBZ   X或空，X为高值',
    CONTROL_TYPE         varchar(5)   null comment '管控类型 IF_LABOR
A1-管控-一般物资
A2-管控-固定资产
A3-管控-费用
B1-非管控-一般物资
B2-非管控-固定资产
B3-非管控-费用',
    CONTROL_TYPE_DESC    varchar(30)  null comment '管控类型描述 IF_LBTXT',
    BATCH_SWITCH         char         null comment '批次管理 IF_XCHPF  X或空，X为启用批次管理',
    IS_DEL               char         null comment '删除标志 IF_LOVRM  X或空，X为已删除',
    STEP_FACTORY_STATUS  varchar(5)   null comment '跨工厂物料状态 IF_MSTAE
01 因采购/仓库而被冻结
02 因任务清单/BOM而被冻结
04 采购冻结
81 MPN:BOM抬头冻结
Z1 因仓库而被冻结'
)
    comment '物料表';

create table organization_dhr
(
    VERSION         int          null comment '乐观锁,版本号',
    CREATED_TIME    datetime     null comment '创建时间',
    CREATED_BY_ID   bigint       null comment '创建人',
    CREATED_BY_NAME varchar(256) null comment '创建人名称',
    UPDATED_TIME    datetime     null comment '更新时间',
    UPDATED_BY_ID   bigint       null comment '更新人',
    UPDATED_BY_NAME varchar(256) null comment '更新人名称',
    IS_AVAILABILITY int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM        varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID              int auto_increment comment '主键ID'
        primary key,
    OBJID           varchar(20)  null comment '组织代码',
    ORGTX           varchar(40)  null comment '对象简称',
    STEXT           varchar(256) null comment '对象全称',
    ZHROBJIDUP      varchar(20)  null comment '上级组织代码',
    ZHRRESPONSIBLE  varchar(20)  null comment '组织负责人工号',
    PZHRFULLNAME    varchar(30)  null comment '姓名',
    PZHROAID        varchar(30)  null comment '组织负责人OA',
    BEGDA           date         null comment '组织开始时间',
    ENDDA           date         null comment '组织结束时间'
)
    comment 'DHR组织机构表 DHR组织机构表';

create table organization_his
(
    VERSION               int          null comment '乐观锁,版本号',
    CREATED_TIME          datetime     null comment '创建时间',
    CREATED_BY_ID         bigint       null comment '创建人',
    CREATED_BY_NAME       varchar(256) null comment '创建人名称',
    UPDATED_TIME          datetime     null comment '更新时间',
    UPDATED_BY_ID         bigint       null comment '更新人',
    UPDATED_BY_NAME       varchar(256) null comment '更新人名称',
    IS_AVAILABILITY       int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM              varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                    int          not null comment 'ID'
        primary key,
    HIS_ID                int          null comment 'HIS_ID HIS系统ID，E看牙ID',
    TENANT_ID             varchar(40)  null comment '租户ID',
    NAME                  varchar(60)  null comment '名字',
    PHONE_NUMBER          varchar(40)  null comment '电话',
    PROVINCE              varchar(60)  null comment '省份',
    CITY                  varchar(60)  null comment '城市',
    DISTRICT              varchar(60)  null comment '区/县',
    ADDRESS               varchar(256) null comment '地址',
    CONTRACT_NAME         varchar(60)  null comment '联系人',
    CONTRACT_PHONE_NUMBER varchar(60)  null comment '联系人电话',
    ABBREVIATION          varchar(20)  null comment '缩写',
    CUSTOMER              varchar(60)  null comment '领健统一账户 Id',
    PARENT_ID             int          null comment '父节点 Id',
    OFFICE_TYPE           int          null comment '类型，群组或诊所',
    SEQ_NUM               int          null comment '排序字段',
    BIZ_TYPE              int          null comment '加盟类型'
)
    comment 'HIS组织机构表';

create table organization_relation
(
    VERSION             int          null comment '乐观锁,版本号',
    CREATED_TIME        datetime     null comment '创建时间',
    CREATED_BY_ID       bigint       null comment '创建人',
    CREATED_BY_NAME     varchar(256) null comment '创建人名称',
    UPDATED_TIME        datetime     null comment '更新时间',
    UPDATED_BY_ID       bigint       null comment '更新人',
    UPDATED_BY_NAME     varchar(256) null comment '更新人名称',
    IS_AVAILABILITY     int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM            varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                  int          not null comment 'ID'
        primary key,
    ORGANIZATION_CODE   bigint       null comment '机构编码 (口腔云平台的机构编码)',
    OBJID               varchar(20)  null comment '组织代码 DHR组织代码',
    ORGANIZATION_HIS_ID int          null comment 'ID_HIS HIS组织机构表ID(E看牙)',
    FACTORY             varchar(5)   null comment 'ID_SAP SAP公司代码'
)
    comment '组织机构关联表 组织机构关联表DHR、HIS、SAP';

create table organization_sap
(
    VERSION                int          null comment '乐观锁,版本号',
    CREATED_TIME           datetime     null comment '创建时间',
    CREATED_BY_ID          bigint       null comment '创建人',
    CREATED_BY_NAME        varchar(256) null comment '创建人名称',
    UPDATED_TIME           datetime     null comment '更新时间',
    UPDATED_BY_ID          bigint       null comment '更新人',
    UPDATED_BY_NAME        varchar(256) null comment '更新人名称',
    IS_AVAILABILITY        int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM               varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                     int auto_increment comment '主键ID'
        primary key,
    FACTORY                varchar(5)   null comment '工厂 IF_WERKS',
    FACTORY_DESC           varchar(30)  null comment '工厂描述 IF_NAME1',
    COMPANY_CODE           varchar(5)   null comment '公司代码 IF_BUKRS',
    COMPANY_NAME           varchar(25)  null comment '公司名称 IF_BUTXT',
    PURCHASE_ORG           varchar(5)   null comment '采购组织 IF_EKORG，采购组织、公司代码、工厂、库存地点',
    PURCHASE_ORG_NAME      varchar(20)  null comment '采购组织名称 IF_EKOTX',
    PURCHASE_GROUP         varchar(5)   null comment '采购组 IF_EKGRP',
    PURCHASE_GROUP_DESC    varchar(20)  null comment '采购组描述 IF_EKNAM',
    STOCK_POSITION         varchar(5)   null comment '库存地点 IF_LGORT',
    STOCK_POSITION_DESC    varchar(20)  null comment '库存地点描述 IF_LGOBE',
    STOCK_POSITION_ADDRESS varchar(256) null comment '库存地点地址 if_street',
    STOCK_TYPE             varchar(5)   null comment '库位类型 IF_ZLGORTT，
1 门店自有库
2 门店中心库
3 门店医生库
4 中心医生库
5 事业部中心库
9 其他',
    STOCK_TYPE_DESC        varchar(60)  null comment '库位类型描述 IF_ZLGORTX'
)
    comment 'SAP组织机构表';

create table patient
(
    VERSION                   int            null comment '乐观锁,版本号',
    CREATED_TIME              datetime       null comment '创建时间',
    CREATED_BY_ID             bigint         null comment '创建人',
    CREATED_BY_NAME           varchar(256)   null comment '创建人名称',
    UPDATED_TIME              datetime       null comment '更新时间',
    UPDATED_BY_ID             bigint         null comment '更新人',
    UPDATED_BY_NAME           varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY           int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                  varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                        int            not null comment 'ID'
        primary key,
    PATIENT_ID                int            null comment 'HIS患者ID',
    NAME                      varchar(40)    null comment '姓名',
    NAME_CODE                 varchar(40)    null comment '首拼码',
    NICK_NAME                 varchar(50)    null comment '昵称',
    PRIVATE_ID                varchar(20)    null comment '病历号',
    OTHER_PRIVATE_ID          varchar(20)    null comment '其它病历号',
    SEX                       varchar(5)     null comment '性别 0:Unknow 1:Male 2:Female',
    BIRTH_TYPE                int            null comment '生日类型',
    BIRTH                     date           null comment '生日',
    MOBILE                    varchar(40)    null comment '手机号',
    PHONE_MOBILE              varchar(40)    null comment '电话号码',
    EMAIL                     varchar(40)    null comment '邮箱',
    OCCUPATION                varchar(20)    null comment '职业',
    QQ                        varchar(20)    null comment 'QQ 号',
    WEIXIN                    varchar(20)    null comment '微信号',
    NATIONALITY               varchar(40)    null comment '国籍',
    IDENTITY_CARD             varchar(40)    null comment '身份证',
    HOME_ADDRESS              varchar(256)   null comment '地址',
    SOURCE_TYPE_LEVEL1        varchar(20)    null comment '患者一级来源',
    SOURCE_TYPE               varchar(20)    null comment '患者二级来源',
    REFEREE_NAME              varchar(40)    null comment '患者三级来源名称',
    REFEREE_MOBILE_OR_CODE    varchar(40)    null comment '患者三级来源手机号或代码',
    REFEREE_ID                int            null comment '患者三级来源 Id',
    MEDICAL_ALTER             varchar(256)   null comment '过敏信息',
    FIRST_VISIT               datetime       null comment '初诊时间',
    NOTES                     varchar(3072)  null comment '备注',
    OVERDUE                   decimal(32, 8) null comment '欠费金额',
    PICTURE_ID                int            null comment '头像图片 Id',
    PATIENT_TYPE              varchar(40)    null comment '患者类型',
    IS_ARCHIVED               char           null comment '是否归档',
    ARCHIVED_TIME             datetime       null comment '归档时间',
    ARCHIVED_USER_NAME        varchar(60)    null comment '归档操作用户名',
    MARKET_CENTER_ACCOUNT     varchar(128)   null comment '微信平台 ID',
    ALI_MARKET_CENTER_ACCOUNT varchar(128)   null comment '支付宝服务窗',
    MEMBERSHIP_ID             int            null comment '会员 Id',
    TAG                       varchar(512)   null comment '标签',
    DUTY_DOCTOR_ID            int            null comment '责任医生 Id',
    DOCTOR_ID                 int            null comment '初诊医生 Id',
    LAST_VISIT                datetime       null comment '上次就诊时间',
    LAST_DOCTOR_ID            int            null comment '上次就诊医生 Id',
    POINT                     int            null comment '积分',
    CONSULTANT_ID             int            null comment '咨询师 Id',
    ATTENDANT_ID              int            null comment '专属客服 Id',
    ADVISOR_ID                int            null comment '专属顾问 Id',
    OFFICE_ID                 int            null comment '组织机构ID',
    TENANT_ID                 varchar(40)    null comment '租户ID'
)
    comment '患者信息表';

create table pdman_db_version
(
    DB_VERSION   varchar(256)  null,
    VERSION_DESC varchar(1024) null,
    CREATED_TIME varchar(32)   null
);

create table person_info
(
    VERSION         int          null comment '乐观锁,版本号',
    CREATED_TIME    datetime     null comment '创建时间',
    CREATED_BY_ID   bigint       null comment '创建人',
    CREATED_BY_NAME varchar(256) null comment '创建人名称',
    UPDATED_TIME    datetime     null comment '更新时间',
    UPDATED_BY_ID   bigint       null comment '更新人',
    UPDATED_BY_NAME varchar(256) null comment '更新人名称',
    IS_AVAILABILITY int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM        varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID              int auto_increment comment 'ID'
        primary key,
    PERNR           varchar(20)  null comment '员工工号',
    ZHRFULLNAME     varchar(30)  null comment '员工姓名',
    ZHROAID         varchar(30)  null comment 'oa系统账户名',
    GBDAT           date         null comment '出生日期',
    ZHREMPESTAT     varchar(20)  null comment '员工状态',
    ZHREMPESTATT    varchar(20)  null comment '员工状态',
    STAT2           varchar(20)  null comment '员工状态（在职 离职）',
    STAT2T          varchar(20)  null comment '员工状态（在职 离职）',
    PERSG           varchar(50)  null comment '员工组编码',
    PERSGT          varchar(50)  null comment '员工组描述',
    PERSK           varchar(50)  null comment '员工子组编码',
    PERSKT          varchar(50)  null comment '员工子组描述',
    ZHROBJID        varchar(50)  null comment '所属组织编号',
    PLANS           varchar(50)  null comment '岗位ID',
    PLANST          varchar(50)  null comment '岗位描述',
    ZHRTKRQ         varchar(50)  null comment '最近一次的入职时间',
    ZHRLZRQ         date         null comment '离职时间',
    ZHRSYQENDDA     date         null comment '试用期预计结束日期',
    ZZ_BEGDA        date         null comment '转正日期',
    ZHRJOBFMLY      varchar(50)  null comment '职族（主序列）',
    ZHRJOBFMLYT     varchar(60)  null comment '职族（主序列）',
    ZHRSEQ          varchar(50)  null comment '序列',
    ZHRSEQT         varchar(50)  null comment '序列',
    ZHRSUBSEQ       varchar(50)  null comment '子序列',
    ZHRSUBSEQT      varchar(50)  null comment '子序列',
    ZHRSECSUBSEQ    varchar(50)  null comment '二级子序列',
    ZHRSECSUBSEQT   varchar(50)  null comment '二级子序列',
    ZHRPOSNRNK      varchar(50)  null comment '职衔',
    ZHRPOSNRNKT     varchar(50)  null comment '职衔',
    ZHRPOSNCLS      varchar(50)  null comment '职级',
    ZHRPOSNCLST     varchar(50)  null comment '职级',
    ZHRDOCFLD       varchar(256) null comment '医生专业',
    ZHRDOCFLDT      varchar(256) null comment '医生专业',
    UPDATETIME_DHR  date         null comment 'DHR更新时间'
)
    comment '人员信息表（DHR）';

create table person_info_his
(
    VERSION             int          null comment '乐观锁,版本号',
    CREATED_TIME        datetime     null comment '创建时间',
    CREATED_BY_ID       bigint       null comment '创建人',
    CREATED_BY_NAME     varchar(256) null comment '创建人名称',
    UPDATED_TIME        datetime     null comment '更新时间',
    UPDATED_BY_ID       bigint       null comment '更新人',
    UPDATED_BY_NAME     varchar(256) null comment '更新人名称',
    IS_AVAILABILITY     int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM            varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                  int          not null comment 'ID'
        primary key,
    HIS_ID              int          null comment 'HIS人员信息ID',
    NAME                varchar(20)  null comment '姓名',
    NAME_CODE           varchar(20)  null comment '首拼码',
    BIRTH               datetime     null comment '生日',
    SEX                 varchar(5)   null comment '性别 0:Unknow 1:Male 2:Female',
    JOB                 varchar(20)  null comment '岗位',
    TITLE               varchar(20)  null comment '职称',
    EMAIL               varchar(40)  null comment '邮箱',
    MOBILE              varchar(20)  null comment '手机',
    IS_MOBILE_VERIFIED  char         null comment '手机号是否已验证',
    HOME_ADDRESS        varchar(256) null comment '家庭住址',
    USER_ID             int          null comment '登录用户 Id',
    IS_SHOW             char         null comment '是否在职 SHOW',
    DEPARTMENT          varchar(60)  null comment '科室',
    EMPLOYEE_NO         varchar(32)  null comment '员工号',
    IS_INTERN           char         null comment '是否是实习生',
    RELATED_PROVIDER_ID int          null comment '关联员工 Id',
    CERTIFICATE_NO      varchar(60)  null comment '证书编号 (如医生的执业证书编号)'
)
    comment 'HIS人员信息表（E看牙人员信息表）';

create table stock_care_product_consume
(
    VERSION            int          null comment '乐观锁,版本号',
    CREATED_TIME       datetime     null comment '创建时间',
    CREATED_BY_ID      bigint       null comment '创建人',
    CREATED_BY_NAME    varchar(256) null comment '创建人名称',
    UPDATED_TIME       datetime     null comment '更新时间',
    UPDATED_BY_ID      bigint       null comment '更新人',
    UPDATED_BY_NAME    varchar(256) null comment '更新人名称',
    IS_AVAILABILITY    int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM           varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                 int auto_increment comment 'ID'
        primary key,
    STOCK_CONSUME_CODE bigint       null comment '出库单号',
    PERSON_INFO_ID     int          null comment '医生ID',
    PERSON_INFO_NAME   varchar(32)  null comment '医生姓名',
    PERNR              varchar(20)  null comment '员工工号',
    ORGANIZATION_CODE  varchar(20)  null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME  varchar(256) null comment '组织机构对象全称 STEXT',
    COST_CENTER_CODE   varchar(10)  null comment '成本中心编码 IF_KOSTL',
    PRODUCT_TYPE       varchar(20)  null comment '产品大类',
    USE_TYPE           int          null comment '使用类型 业务招待领用:  Z29
市场营销活动：Z31
治疗处置领用：201
销售领用出库：Z33
SAP的出库用途字段，IF_BWART',
    CHARGE_ORDER_ID    int          null comment '收费单',
    STATUS             int          null comment '状态 1成功2失败3已冲销4冲销失败',
    PATIENT_NAME       varchar(40)  null comment '患者姓名',
    REMARK             varchar(256) null comment '备注',
    IF_REMBLNR         varchar(10)  null comment '冲销凭证',
    IF_MBLNR           varchar(10)  null comment '自有库出库单'
)
    comment '库存护理品出库单表';

create table stock_care_product_consume_detail
(
    VERSION                       int            null comment '乐观锁,版本号',
    CREATED_TIME                  datetime       null comment '创建时间',
    CREATED_BY_ID                 bigint         null comment '创建人',
    CREATED_BY_NAME               varchar(256)   null comment '创建人名称',
    UPDATED_TIME                  datetime       null comment '更新时间',
    UPDATED_BY_ID                 bigint         null comment '更新人',
    UPDATED_BY_NAME               varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY               int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                      varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                            int            not null comment 'ID'
        primary key,
    STOCK_CARE_PRODUCT_CONSUME_ID int            null comment '护理品出库单ID',
    SUPPLIER_BATCH_NUMBER         varchar(20)    null comment '供应商批号',
    SUPPLIER_CODE                 varchar(10)    null comment '供应商编码 IF_LIFNR',
    SUPPLIER_NAME                 varchar(35)    null comment '供应商名称 IF_NAME1',
    AMOUNT                        decimal(10, 2) null comment '数量',
    UNIT                          varchar(5)     null comment '单位',
    BATCH_NUMBER                  varchar(10)    null comment 'SAP批次',
    CHARGE_ITEM_CODE              varchar(32)    null comment '处置项编码',
    CHARGE_ITEM_NAME              varchar(60)    null comment '处置项名称',
    DEDUCTION_EXECUTION_STEP_ID   varchar(60)    null comment '划扣执行步骤 账单流水号--处置项编码--划扣执行步骤ID',
    STOCK_ADDRESS                 varchar(5)     null comment '库存地点 中心库及自有库，如同出库单，包含两种1&2两种类型库位，则入参需拆分发送',
    STOCK_ADDRESS_DESC            varchar(20)    null comment '库存地点描述 IF_LGOBE',
    FACTORY                       varchar(10)    null comment '工厂 IF_WERKS',
    FACTORY_DESC                  varchar(32)    null comment '工厂描述 IF_WTEXT',
    MATERIAL_CODE                 varchar(40)    null comment '物料编码 IF_MATNR',
    MATERIAL_DESC                 varchar(40)    null comment '物料描述 IF_MAKTX',
    MATERIAL_GROUP                varchar(10)    null comment '物料组 IF_MATKL',
    LOCATION_TYPE                 varchar(5)     null comment '库位类型 IF_ZLGORTT',
    LOCATION_TYPE_DESC            varchar(60)    null comment '库位类型描述 IF_ZLGORTX',
    STATUS                        int            null comment '状态 1未发放
2部分发放
3发放失败
4全部发放',
    UNIT_DESC                     varchar(30)    null comment '单位描述 IF_MSEHL',
    MANUFACTORE_DATE              date           null comment '生产日期 IF_HSDAT',
    EFFECTIVE_DATE                date           null comment '有效日期 IF_VFDAT'
)
    comment '库存护理品出库单明细表';

create table stock_doctor_stockreturn
(
    VERSION                 int          null comment '乐观锁,版本号',
    CREATED_TIME            datetime     null comment '创建时间',
    CREATED_BY_ID           bigint       null comment '创建人',
    CREATED_BY_NAME         varchar(256) null comment '创建人名称',
    UPDATED_TIME            datetime     null comment '更新时间',
    UPDATED_BY_ID           bigint       null comment '更新人',
    UPDATED_BY_NAME         varchar(256) null comment '更新人名称',
    IS_AVAILABILITY         int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                      int auto_increment comment 'ID'
        primary key,
    DOCTOR_STOCKRETURN_CODE bigint       null comment '医生库退库单号',
    SAP_CODE                varchar(10)  null comment 'SAP单据编号 物料凭证号',
    STATUS                  int          null comment '状态 1未发放
2部分发放
3发放失败
4全部发放',
    PERSON_INFO_ID          int          null comment '医生ID',
    PERSON_INFO_NAME        varchar(32)  null comment '医生姓名',
    PERNR                   varchar(20)  null comment '员工工号',
    ORGANIZATION_CODE       varchar(20)  null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME       varchar(256) null comment '组织机构对象全称 STEXT',
    IF_MBLNR311             varchar(10)  null comment '物料凭证号'
)
    comment '医生库退库单表';

create table stock_doctor_stockreturn_detail
(
    VERSION               int            null comment '乐观锁,版本号',
    CREATED_TIME          datetime       null comment '创建时间',
    CREATED_BY_ID         bigint         null comment '创建人',
    CREATED_BY_NAME       varchar(256)   null comment '创建人名称',
    UPDATED_TIME          datetime       null comment '更新时间',
    UPDATED_BY_ID         bigint         null comment '更新人',
    UPDATED_BY_NAME       varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY       int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM              varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                    int auto_increment comment 'ID'
        primary key,
    DOCTOR_STOCKRETURN_ID int            null comment '医生库退库单ID',
    MATERIAL_CODE         varchar(40)    null comment '物料编码 IF_MATNR',
    MATERIAL_DESC         varchar(40)    null comment '物料描述 IF_MAKTX',
    DELIVER_GOODS_ADDRESS varchar(5)     null comment '发货库存地点',
    RECEIVE_GOODS_ADDRESS varchar(5)     null comment '收货库存地点',
    KMEIN                 varchar(5)     null comment '特殊库存标识',
    AMOUNT                decimal(10, 2) null comment '数量',
    UNIT                  varchar(5)     null comment '单位',
    BATCH                 varchar(10)    null comment 'SAP批次',
    SUPPLIER_BATCH_NUMBER varchar(20)    null comment '供应商批号',
    STATUS                int            null comment '状态 1未同步2已同步完成3同步失败'
)
    comment '医生库退库单明细表';

create table stock_low_sap_bill_no
(
    VERSION                      int          null comment '乐观锁,版本号',
    CREATED_TIME                 datetime     null comment '创建时间',
    CREATED_BY_ID                bigint       null comment '创建人',
    CREATED_BY_NAME              varchar(256) null comment '创建人名称',
    UPDATED_TIME                 datetime     null comment '更新时间',
    UPDATED_BY_ID                bigint       null comment '更新人',
    UPDATED_BY_NAME              varchar(256) null comment '更新人名称',
    IS_AVAILABILITY              int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                     varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                           int auto_increment comment 'ID'
        primary key,
    STOCK_LOWMATERIAL_CONSUME_ID int          null comment '低值耗材出库单ID',
    CODE                         varchar(32)  null comment '单据编码',
    BILL_NO_VALUE                varchar(32)  null comment '单据内容值',
    NAME                         varchar(32)  null comment '单据名称'
)
    comment '低值耗材出库单SAP单据关联表';

create table stock_lowmaterial_consume
(
    VERSION                        int          null comment '乐观锁,版本号',
    CREATED_TIME                   datetime     null comment '创建时间',
    CREATED_BY_ID                  bigint       null comment '创建人',
    CREATED_BY_NAME                varchar(256) null comment '创建人名称',
    UPDATED_TIME                   datetime     null comment '更新时间',
    UPDATED_BY_ID                  bigint       null comment '更新人',
    UPDATED_BY_NAME                varchar(256) null comment '更新人名称',
    IS_AVAILABILITY                int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                       varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                             int          null comment 'ID',
    STOCK_LOWMATERIAL_CONSUME_CODE bigint       null comment '出库单号',
    STATUS                         int          null comment '状态 1未出库2部分出库3出库失败4全部出库5已冲销6冲销出错7部分冲销出错',
    PERSON_INFO_ID                 int          null comment '医生ID',
    PERSON_INFO_NAME               varchar(32)  null comment '医生姓名',
    PERNR                          varchar(20)  not null comment '员工工号'
        primary key,
    ORGANIZATION_CODE              varchar(20)  null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME              varchar(256) null comment '组织机构对象全称 STEXT',
    COST_CENTER_CODE               varchar(10)  null comment '成本中心编码 IF_KOSTL',
    PRODUCT_TYPE                   varchar(20)  null comment '产品大类',
    USE_TYPE                       int          null comment '使用类型 1公出2非公出'
)
    comment '低值耗材出库单表';

create table stock_lowmaterial_consume_detail
(
    VERSION                      int            null comment '乐观锁,版本号',
    CREATED_TIME                 datetime       null comment '创建时间',
    CREATED_BY_ID                bigint         null comment '创建人',
    CREATED_BY_NAME              varchar(256)   null comment '创建人名称',
    UPDATED_TIME                 datetime       null comment '更新时间',
    UPDATED_BY_ID                bigint         null comment '更新人',
    UPDATED_BY_NAME              varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY              int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                     varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                           int            null comment 'ID',
    STOCK_LOWMATERIAL_CONSUME_ID int            null comment '低值耗材出库单ID',
    STOCK_ADDRESS                varchar(5)     null comment '库存地点 中心库及自有库，如同出库单，包含两种1&2两种类型库位，则入参需拆分发送IF_LGORT',
    STOCK_ADDRESS_DESC           varchar(20)    null comment '库存地点描述 IF_LGOBE',
    FACTORY                      varchar(10)    null comment '工厂 IF_WERKS',
    FACTORY_DESC                 varchar(32)    null comment '工厂描述 IF_WTEXT',
    MATERIAL_CODE                varchar(40)    null comment '物料编码 IF_MATNR',
    MATERIAL_DESC                varchar(40)    null comment '物料描述 IF_MAKTX',
    MATERIAL_GROUP               varchar(10)    null comment '物料组 IF_MATKL',
    LOCATION_TYPE                varchar(5)     null comment '库位类型 IF_ZLGORTT',
    LOCATION_TYPE_DESC           varchar(60)    null comment '库位类型描述 IF_ZLGORTX',
    SUPPLIER_CODE                varchar(10)    null comment '供应商编码 IF_LIFNR',
    SUPPLIER_NAME                varchar(35)    null comment '供应商名称 IF_NAME1',
    SUPPLIER_BATCH_NUMBER        varchar(20)    null comment '供应商批号 IF_LICHA',
    UNIT                         varchar(5)     null comment '单位 IF_MSEHL',
    BATCH_NUMBER                 varchar(10)    null comment 'SAP批次 IF_CHARG',
    AMOUNT                       decimal(10, 2) null comment '数量 IF_MENGE',
    STATUS                       int            null comment '状态 1未发放
2部分发放
3发放失败
4全部发放',
    UNIT_DESC                    varchar(30)    null comment '单位描述 IF_MSEHL',
    MANUFACTORE_DATE             date           null comment '生产日期 IF_HSDAT',
    EFFECTIVE_DATE               date           null comment '有效日期 IF_VFDAT'
)
    comment '低值耗材出库单明细表';

create table stock_material_consume
(
    VERSION                       int          null comment '乐观锁,版本号',
    CREATED_TIME                  datetime     null comment '创建时间',
    CREATED_BY_ID                 bigint       null comment '创建人',
    CREATED_BY_NAME               varchar(256) null comment '创建人名称',
    UPDATED_TIME                  datetime     null comment '更新时间',
    UPDATED_BY_ID                 bigint       null comment '更新人',
    UPDATED_BY_NAME               varchar(256) null comment '更新人名称',
    IS_AVAILABILITY               int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                      varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                            int auto_increment comment 'ID'
        primary key,
    STOCK_MATERIAL_CONSUME_CODE   bigint       null comment '出库单号',
    STATUS                        int          null comment '状态 1未出库2部分出库3出库失败4全部出库5已冲销6冲销出错7部分冲销出错',
    PERSON_INFO_ID                int          null comment '医生ID',
    PERSON_INFO_NAME              varchar(32)  null comment '医生姓名',
    PERNR                         varchar(20)  null comment '员工工号',
    ORGANIZATION_CODE             varchar(20)  null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME             varchar(256) null comment '组织机构对象全称 STEXT',
    COST_CENTER_CODE              varchar(10)  null comment '成本中心编码 IF_KOSTL',
    PRODUCT_TYPE                  varchar(20)  null comment '产品大类',
    PATIENT_NAME                  varchar(40)  null comment '患者姓名',
    CHARGE_ITEM_CODE              varchar(32)  null comment '处置项编码',
    CHARGE_ITEM_NAME              varchar(60)  null comment '处置项名称',
    DEDUCTION_EXECUTION_STEP_CODE varchar(60)  null comment '划扣执行步骤编码 账单流水号--处置项编码--划扣执行步骤ID',
    DEDUCTION_EXECUTION_STEP_ID   int          null comment '划扣执行步骤ID',
    CHARGE_ORDER_ID               int          null comment '收费单ID'
)
    comment '划扣类高值耗材出库单表';

create table stock_material_consume_detail
(
    VERSION                   int            null comment '乐观锁,版本号',
    CREATED_TIME              datetime       null comment '创建时间',
    CREATED_BY_ID             bigint         null comment '创建人',
    CREATED_BY_NAME           varchar(256)   null comment '创建人名称',
    UPDATED_TIME              datetime       null comment '更新时间',
    UPDATED_BY_ID             bigint         null comment '更新人',
    UPDATED_BY_NAME           varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY           int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                  varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                        int auto_increment comment 'ID'
        primary key,
    STOCK_MATERIAL_CONSUME_ID int            null comment '耗材出库单ID',
    STOCK_ADDRESS             varchar(5)     null comment '库存地点 中心库及自有库，如同出库单，包含两种1&2两种类型库位，则入参需拆分发送IF_LGORT',
    STOCK_ADDRESS_DESC        varchar(20)    null comment '库存地点描述 IF_LGOBE',
    FACTORY                   varchar(10)    null comment '工厂 IF_WERKS',
    FACTORY_DESC              varchar(32)    null comment '工厂描述 IF_WTEXT',
    MATERIAL_CODE             varchar(40)    null comment '物料编码 IF_MATNR',
    MATERIAL_DESC             varchar(40)    null comment '物料描述 IF_MAKTX',
    MATERIAL_GROUP            varchar(10)    null comment '物料组 IF_MATKL',
    LOCATION_TYPE             varchar(5)     null comment '库位类型 IF_ZLGORTT',
    LOCATION_TYPE_DESC        varchar(60)    null comment '库位类型描述 IF_ZLGORTX',
    SUPPLIER_CODE             varchar(10)    null comment '供应商编码 IF_LIFNR',
    SUPPLIER_NAME             varchar(35)    null comment '供应商名称 IF_NAME1',
    SUPPLIER_BATCH_NUMBER     varchar(20)    null comment '供应商批号 IF_LICHA',
    UNIT                      varchar(5)     null comment '单位 IF_MSEHL',
    BATCH_NUMBER              varchar(10)    null comment 'SAP批次 IF_CHARG',
    AMOUNT                    decimal(10, 2) null comment '数量 IF_MENGE',
    STATUS                    int            null comment '状态 1未发放
2部分发放
3发放失败
4全部发放',
    FAIL_AMOUNT               decimal(10, 2) null comment '失败数量 失败种植体数量。接口领用标识字段0=失败种植体，1=实际领用。',
    UNIT_DESC                 varchar(30)    null comment '单位描述 IF_MSEHL',
    MANUFACTORE_DATE          date           null comment '生产日期 IF_HSDAT',
    EFFECTIVE_DATE            date           null comment '有效日期 IF_VFDAT'
)
    comment '划扣类高值耗材出库单明细表';

create table stock_receive
(
    VERSION            int          null comment '乐观锁,版本号',
    CREATED_TIME       datetime     null comment '创建时间',
    CREATED_BY_ID      bigint       null comment '创建人',
    CREATED_BY_NAME    varchar(256) null comment '创建人名称',
    UPDATED_TIME       datetime     null comment '更新时间',
    UPDATED_BY_ID      bigint       null comment '更新人',
    UPDATED_BY_NAME    varchar(256) null comment '更新人名称',
    IS_AVAILABILITY    int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM           varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                 int auto_increment comment 'ID'
        primary key,
    STOCK_RECEIVE_CODE bigint       null comment '领用单号',
    SAP_CODE           varchar(10)  null comment 'SAP单据编号',
    STATUS             int          null comment '状态 1未发放
2部分发放
3发放失败
4全部发放',
    PERSON_INFO_ID     int          null comment '医生ID',
    PERSON_INFO_NAME   varchar(32)  null comment '医生姓名',
    PERNR              varchar(20)  null comment '员工工号',
    ORGANIZATION_CODE  varchar(20)  null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME  varchar(256) null comment '组织机构对象全称 STEXT'
)
    comment '库存划扣类耗材领用单表';

create table stock_receive_apply_detail
(
    VERSION           int            null comment '乐观锁,版本号',
    CREATED_TIME      datetime       null comment '创建时间',
    CREATED_BY_ID     bigint         null comment '创建人',
    CREATED_BY_NAME   varchar(256)   null comment '创建人名称',
    UPDATED_TIME      datetime       null comment '更新时间',
    UPDATED_BY_ID     bigint         null comment '更新人',
    UPDATED_BY_NAME   varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY   int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM          varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                int auto_increment comment 'ID'
        primary key,
    STOCK_RECEIVE_ID  int            null comment '领用单ID',
    ORGANIZATION_CODE varchar(20)    null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME varchar(256)   null comment '组织机构对象全称 STEXT',
    MATERIAL_CODE     varchar(40)    null comment '物料编码 IF_MATNR',
    MATERIAL_DESC     varchar(40)    null comment '物料描述 IF_MAKTX',
    UNIT              varchar(5)     null comment '单位',
    APPLY_NUM         decimal(10, 2) null comment '申请数量',
    UNIT_DESC         varchar(30)    null comment '基本计量单位描述 IF_MSEHL',
    CONTROL_TYPE_DESC varchar(30)    null comment '管控类型描述 IF_LBTXT',
    BRAND             varchar(20)    null comment '品牌 IF_ZPINP',
    SPECS             varchar(50)    null comment '规格 IF_GG',
    GOODS_MODEL       varchar(30)    null comment '型号 IF_XH',
    IS_BARGAIN        char           null comment '是否划扣耗材 IF_ZHKBS    X或空，X为划扣',
    IS_HIGH_VALUE     char           null comment '高低值 IF_ZGZBZ   X或空，X为高值',
    BATCH_SWITCH      char           null comment '批次管理 IF_XCHPF  X或空，X为启用批次管理',
    STATUS            int            null comment '状态 0未发放1发放成功2部分发放3发放失败'
)
    comment '库存划扣类耗材领用申请单明细表';

create table stock_receive_detail
(
    VERSION                int            null comment '乐观锁,版本号',
    CREATED_TIME           datetime       null comment '创建时间',
    CREATED_BY_ID          bigint         null comment '创建人',
    CREATED_BY_NAME        varchar(256)   null comment '创建人名称',
    UPDATED_TIME           datetime       null comment '更新时间',
    UPDATED_BY_ID          bigint         null comment '更新人',
    UPDATED_BY_NAME        varchar(256)   null comment '更新人名称',
    IS_AVAILABILITY        int            null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM               varchar(5)     null comment '平台 平台：1、拜博；2、养康',
    ID                     int            null comment 'ID',
    STOCK_RECEIVE_ID       int            null comment '领用单ID',
    STOCK_RECEIVE_APPLY_ID int            null comment '领用申请单ID',
    MATERIAL_CODE          varchar(40)    null comment '物料编码 IF_MATNR',
    MATERIAL_DESC          varchar(40)    null comment '物料描述 IF_MAKTX',
    DELIVER_GOODS_ADDRESS  varchar(5)     null comment '发货库存地点 IF_LGORT库存地点',
    STOCK_ADDRESS_DESC     varchar(20)    null comment '库存地点描述 IF_LGOBE',
    RECEIVE_GOODS_ADDRESS  varchar(5)     null comment '收货库存地点 IF_LGORT1',
    KMEIN                  varchar(5)     null comment '特殊库存标识 SAP中当库位类型=2时，仅抓取特殊库存标识=K的库存数量',
    AMOUNT                 decimal(10, 2) null comment '数量',
    UNIT                   varchar(5)     null comment '单位',
    UNIT_DESC              varchar(30)    null comment '单位描述 IF_MSEHL',
    BATCH                  varchar(10)    null comment 'SAP批次',
    SUPPLIER_BATCH_NUMBER  varchar(20)    null comment '供应商批号',
    STATUS                 int            null comment '状态 1未同步2已同步完成3同步失败',
    MATERIAL_GROUP         varchar(10)    null comment '物料组 IF_MATKL',
    LOCATION_TYPE          varchar(5)     null comment '库位类型 IF_ZLGORTT',
    LOCATION_TYPE_DESC     varchar(60)    null comment '库位类型描述 IF_ZLGORTX',
    SUPPLIER_CODE          varchar(10)    null comment '供应商编码 IF_LIFNR',
    SUPPLIER_NAME          varchar(35)    null comment '供应商名称 IF_NAME1',
    MANUFACTORE_DATE       date           null comment '生产日期 IF_HSDAT',
    EFFECTIVE_DATE         date           null comment '有效日期 IF_VFDAT'
)
    comment '库存划扣类耗材领用单明细表';

create table stock_sap_bill_no
(
    VERSION                   int          null comment '乐观锁,版本号',
    CREATED_TIME              datetime     null comment '创建时间',
    CREATED_BY_ID             bigint       null comment '创建人',
    CREATED_BY_NAME           varchar(256) null comment '创建人名称',
    UPDATED_TIME              datetime     null comment '更新时间',
    UPDATED_BY_ID             bigint       null comment '更新人',
    UPDATED_BY_NAME           varchar(256) null comment '更新人名称',
    IS_AVAILABILITY           int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM                  varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                        int auto_increment comment 'ID'
        primary key,
    STOCK_MATERIAL_CONSUME_ID int          null comment '耗材出库单ID',
    CODE                      varchar(32)  null comment '单据编码',
    BILL_NO_VALUE             varchar(32)  null comment '单据内容值',
    NAME                      varchar(32)  null comment '单据名称'
)
    comment '划扣类高值耗材出库单SAP单据关联表';

create table sys_dict
(
    VERSION         int          null comment '乐观锁,版本号',
    CREATED_TIME    datetime     null comment '创建时间',
    CREATED_BY_ID   bigint       null comment '创建人',
    CREATED_BY_NAME varchar(256) null comment '创建人名称',
    UPDATED_TIME    datetime     null comment '更新时间',
    UPDATED_BY_ID   bigint       null comment '更新人',
    UPDATED_BY_NAME varchar(256) null comment '更新人名称',
    IS_AVAILABILITY int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM        varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID              int auto_increment comment 'ID'
        primary key,
    DICT_CODE       varchar(32)  null comment '字典编码',
    DICT_VALUE      varchar(32)  null comment '字典值',
    DICT_DESC       varchar(32)  null comment '字典描述',
    TYPE_CODE       varchar(20)  null comment '字典类型编码',
    REMARK          varchar(60)  null comment '备注'
)
    comment '数据字典表';

create table sys_operate_log
(
    VERSION           int          null comment '乐观锁,版本号',
    CREATED_TIME      datetime     null comment '创建时间',
    CREATED_BY_ID     bigint       null comment '创建人',
    CREATED_BY_NAME   varchar(256) null comment '创建人名称',
    UPDATED_TIME      datetime     null comment '更新时间',
    UPDATED_BY_ID     bigint       null comment '更新人',
    UPDATED_BY_NAME   varchar(256) null comment '更新人名称',
    IS_AVAILABILITY   int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM          varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                int          not null comment 'ID',
    TYPE_DESC         varchar(20)  null comment '操作类型',
    CONTENT           varchar(512) null comment '操作内容',
    PERNR             varchar(20)  not null comment '操作人员工工号',
    ORGANIZATION_CODE varchar(20)  null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME varchar(256) null comment '组织机构对象全称 STEXT',
    primary key (ID, PERNR)
)
    comment '操作日志表';

create table sys_task_info
(
    VERSION           int          null comment '乐观锁,版本号',
    CREATED_TIME      datetime     null comment '创建时间',
    CREATED_BY_ID     bigint       null comment '创建人',
    CREATED_BY_NAME   varchar(256) null comment '创建人名称',
    UPDATED_TIME      datetime     null comment '更新时间',
    UPDATED_BY_ID     bigint       null comment '更新人',
    UPDATED_BY_NAME   varchar(256) null comment '更新人名称',
    IS_AVAILABILITY   int          null comment '是否有效 是否有效：0、无效；1、有效；',
    PLATFORM          varchar(5)   null comment '平台 平台：1、拜博；2、养康',
    ID                int          not null comment 'ID'
        primary key,
    ENTITY_ID         int          null comment '关联实体ID',
    STATUS            int          null comment '状态 1待处理
2已处理
3已关闭',
    TYPE              int          null comment '类型 1划扣耗材出库
2非划扣耗材出库
3收费单划扣记录变化
4护理表',
    ORGANIZATION_CODE varchar(20)  null comment '组织机构代码 ORGTX',
    ORGANIZATION_NAME varchar(256) null comment '组织机构对象全称 STEXT'
)
    comment '待办任务表';

