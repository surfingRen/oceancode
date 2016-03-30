/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16/3/28 上午10:15:34                           */
/*==============================================================*/


drop table if exists t_activity;

drop table if exists t_activity_rule;

drop table if exists t_code;

drop table if exists t_order;

drop table if exists t_order_flow;

drop table if exists t_shop;

drop table if exists t_stuff;

drop table if exists t_stuff_cat;

drop table if exists t_user;

/*==============================================================*/
/* Table: t_activity                                            */
/*==============================================================*/
create table t_activity
(
   id                   int not null auto_increment comment '主键',
   show_id              int comment '商户id',
   name                 varchar(200) comment '活动名称',
   note                 text comment '活动描述',
   type                 varchar(2) default '1' comment '优惠类型
            1.满减
            2.满折扣
            3.赠品
            4.自定义,系统不做任何操作',
   ctime                timestamp default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
)
charset = UTF8;

alter table t_activity comment '活动表,促销、优惠等';

/*==============================================================*/
/* Table: t_activity_rule                                       */
/*==============================================================*/
create table t_activity_rule
(
   id                   int not null auto_increment comment '主键',
   activity_id          int comment '活动id',
   n1                   varchar(200) comment '不同类型活动含义不同',
   n2                   varchar(200) comment '不同类型活动含义不同',
   n3                   varchar(200) comment '不同类型活动含义不同',
   n4                   varchar(200) comment '不同类型活动含义不同',
   primary key (id)
)
charset = UTF8;

alter table t_activity_rule comment '活动规则';

/*==============================================================*/
/* Table: t_code                                                */
/*==============================================================*/
create table t_code
(
   ctype                varchar(100) comment '代码类型',
   ckey                 varchar(100) comment '键',
   value                varchar(1000) comment '值',
   n1                   varchar(100) comment '扩展',
   n2                   varchar(100) comment '扩展',
   n3                   varchar(100) comment '扩展',
   n4                   varchar(100) comment '扩展',
   n5                   varchar(100) comment '扩展',
   n6                   varchar(100) comment '扩展',
   n7                   varchar(100) comment '扩展',
   n8                   varchar(100) comment '扩展',
   ctime                timestamp default CURRENT_TIMESTAMP comment '创建时间'
)
charset = UTF8;

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   id                   int not null auto_increment comment '主键',
   ctime                timestamp default CURRENT_TIMESTAMP comment '创建时间',
   status               varchar(2) default '1' comment '状态',
   money_all            double comment '总金额',
   money_minus          double comment '优惠金额',
   money_pay            double comment '实际支付金额',
   utime                timestamp comment '最后修改时间',
   ptime                timestamp comment '支付时间',
   user_id              int,
   primary key (id)
)
charset = UTF8;

alter table t_order comment '订单';

/*==============================================================*/
/* Table: t_order_flow                                          */
/*==============================================================*/
create table t_order_flow
(
   id                   int not null comment '主键',
   order_id             int comment '订单id',
   time                 timestamp comment '发生时间',
   user_id              int comment '用户id',
   event                varchar(10) comment '事件',
   note                 varchar(400) comment '事件描述',
   staff_id             int comment '商品id',
   status               varchar(2) comment '状态
            对于需要状态跟踪的功能,如:
            1.菜品下单成功
            2.制作中
            3.已制作
            4.已上菜
            5.投诉菜品
            6.退单
            7.外带',
   primary key (id)
)
charset = UTF8;

alter table t_order_flow comment '订单流水';

/*==============================================================*/
/* Table: t_shop                                                */
/*==============================================================*/
create table t_shop
(
   id                   int not null auto_increment comment 'id',
   name                 varchar(50) not null comment '用户名',
   pwd                  varchar(50) not null default '123456' comment '密码',
   phone                varchar(15) comment '电话',
   email                varchar(50) default '-' comment '电子邮件',
   ctime                timestamp default CURRENT_TIMESTAMP comment '创建时间',
   utime                timestamp comment '更新时间',
   dtime                timestamp comment '删除时间',
   status               varchar(2) default '0' comment '状态',
   status2              varchar(2) default '0' comment '状态位2',
   nickname             varchar(200) default '-' comment '商户昵称',
   address              varchar(300) default '-' comment '地址',
   phone2               varchar(15) comment '电话2',
   phone3               varchar(15) comment '电话3',
   note                 text comment '自展示信息',
   lng                  varchar(20) comment '经度',
   lat                  varchar(20) comment '维度',
   source               varchar(20) comment '数据来源',
   id3                  varchar(50) comment '第三方id',
   logo                 varchar(300) comment 'logo照片',
   primary key (id)
)
charset = UTF8;

alter table t_shop comment '商店/餐馆表';

/*==============================================================*/
/* Table: t_stuff                                               */
/*==============================================================*/
create table t_stuff
(
   id                   int not null auto_increment comment '主键',
   cat_id               int default 1 comment '分类id',
   name                 varchar(100) comment '名称',
   note                 text comment '描述',
   photos               varchar(2000) comment '图片',
   money                double default 0 comment '价格',
   money2               varchar(100) default '0' comment '自定义价格说明',
   ctime                timestamp default CURRENT_TIMESTAMP comment '创建时间',
   status               varchar(2) default '1' comment '状态',
   id3                  varchar(50) comment '第三方id',
   sales_count          varchar(50) comment '已卖数量',
   recommend            varchar(50) comment '推荐数量',
   primary key (id)
)
charset = UTF8;

alter table t_stuff comment '菜品/商品表';

/*==============================================================*/
/* Table: t_stuff_cat                                           */
/*==============================================================*/
create table t_stuff_cat
(
   id                   int not null auto_increment comment '主键',
   pid                  int default NULL comment '上级id',
   shop_id              int comment '商户id',
   text                 varchar(100) comment '名称',
   note                 varchar(300) default '分类描述' comment '描述',
   status               varchar(2) default '1' comment '状态',
   ctime                timestamp default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
)
charset = UTF8;

alter table t_stuff_cat comment '商品分类';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   int not null auto_increment comment 'id',
   name                 varchar(50) not null comment '用户名',
   pwd                  varchar(50) not null default '123456' comment '密码',
   phone                varchar(15) comment '电话',
   email                varchar(50) default '-' comment '电子邮件',
   ctime                timestamp default CURRENT_TIMESTAMP comment '创建时间',
   utime                timestamp comment '更新时间',
   dtime                timestamp comment '删除时间',
   status               varchar(2) default '1' comment '状态',
   status2              varchar(2) default '1' comment '状态位2',
   primary key (id)
)
charset = UTF8;

alter table t_user comment '用户表';

