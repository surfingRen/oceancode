/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16/3/24 ����5:00:01                            */
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
   id                   int(11) not null auto_increment comment '����',
   show_id              int(11) comment '�̻�id',
   name                 varchar(200) comment '�����',
   note                 text comment '�����',
   type                 varchar(2) default '1' comment '�Ż�����
            1.����
            2.���ۿ�
            3.��Ʒ
            4.�Զ���,ϵͳ�����κβ���',
   ctime                datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table t_activity comment '���,�������Żݵ�';

/*==============================================================*/
/* Table: t_activity_rule                                       */
/*==============================================================*/
create table t_activity_rule
(
   id                   int(11) not null auto_increment comment '����',
   activity_id          int(11) comment '�id',
   n1                   varchar(200) comment '��ͬ���ͻ���岻ͬ',
   n2                   varchar(200) comment '��ͬ���ͻ���岻ͬ',
   n3                   varchar(200) comment '��ͬ���ͻ���岻ͬ',
   n4                   varchar(200) comment '��ͬ���ͻ���岻ͬ',
   primary key (id)
);

alter table t_activity_rule comment '�����';

/*==============================================================*/
/* Table: t_code                                                */
/*==============================================================*/
create table t_code
(
   ctype                varchar(100) comment '��������',
   ckey                 varchar(100) comment '��',
   value                varchar(1000) comment 'ֵ',
   n1                   varchar(100) comment '��չ',
   n2                   varchar(100) comment '��չ',
   n3                   varchar(100) comment '��չ',
   n4                   varchar(100) comment '��չ',
   n5                   varchar(100) comment '��չ',
   n6                   varchar(100) comment '��չ',
   n7                   varchar(100) comment '��չ',
   n8                   varchar(100) comment '��չ',
   ctime                datetime default CURRENT_TIMESTAMP comment '����ʱ��'
);

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   id                   int(11) not null auto_increment comment '����',
   ctime                datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   status               varchar(2) default '1' comment '״̬',
   money_all            double comment '�ܽ��',
   money_minus          double comment '�Żݽ��',
   money_pay            double comment 'ʵ��֧�����',
   utime                datetime comment '����޸�ʱ��',
   ptime                datetime comment '֧��ʱ��',
   user_id              int(11),
   primary key (id)
);

alter table t_order comment '����';

/*==============================================================*/
/* Table: t_order_flow                                          */
/*==============================================================*/
create table t_order_flow
(
   id                   int(20) not null comment '����',
   order_id             int(11) comment '����id',
   time                 datetime comment '����ʱ��',
   user_id              int(11) comment '�û�id',
   event                varchar(10) comment '�¼�',
   note                 varchar(400) comment '�¼�����',
   staff_id             int(11) comment '��Ʒid',
   status               varchar(2) comment '״̬
            ������Ҫ״̬���ٵĹ���,��:
            1.��Ʒ�µ��ɹ�
            2.������
            3.������
            4.���ϲ�
            5.Ͷ�߲�Ʒ
            6.�˵�
            7.���',
   primary key (id)
);

alter table t_order_flow comment '������ˮ';

/*==============================================================*/
/* Table: t_shop                                                */
/*==============================================================*/
create table t_shop
(
   id                   int(11) not null auto_increment comment 'id',
   name                 varchar(50) not null comment '�û���',
   pwd                  varchar(50) not null default '123456' comment '����',
   phone                int(20) comment '�绰',
   email                varchar(50) default '-' comment '�����ʼ�',
   ctime                datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   utime                datetime comment '����ʱ��',
   dtime                datetime comment 'ɾ��ʱ��',
   status               varchar(2) default '0' comment '״̬',
   status2              varchar(2) default '0' comment '״̬λ2',
   nickname             varchar(200) default '-' comment '�̻��ǳ�',
   address              varchar(300) default '-' comment '��ַ',
   phone2               int(20) comment '�绰2',
   phone3               int(20) comment '�绰3',
   note                 text comment '��չʾ��Ϣ',
   primary key (id)
);

alter table t_shop comment '�̵�/�ι۱�';

/*==============================================================*/
/* Table: t_stuff                                               */
/*==============================================================*/
create table t_stuff
(
   id                   int(11) not null auto_increment comment '����',
   cat_id               int(11) comment '����id',
   name                 varchar(100) comment '����',
   note                 text comment '����',
   photos               varchar(2000) comment 'ͼƬ',
   money                double comment '�۸�',
   money2               double comment '�Żݺ�۸�',
   ctime                datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   status               varchar(2) comment '״̬',
   primary key (id)
);

alter table t_stuff comment '��Ʒ/��Ʒ��';

/*==============================================================*/
/* Table: t_stuff_cat                                           */
/*==============================================================*/
create table t_stuff_cat
(
   id                   int(11) not null auto_increment comment '����',
   pid                  int(11) default NULL comment '�ϼ�id',
   shop_id              int(11) comment '�̻�id',
   text                 varchar(100) comment '����',
   note                 varchar(300) default '��������' comment '����',
   status               varchar(2) default '1' comment '״̬',
   ctime                datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table t_stuff_cat comment '��Ʒ����';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   int(11) not null auto_increment comment 'id',
   name                 varchar(50) not null comment '�û���',
   pwd                  varchar(50) not null default '123456' comment '����',
   phone                int(20) comment '�绰',
   email                varchar(50) default '-' comment '�����ʼ�',
   ctime                datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   utime                datetime comment '����ʱ��',
   dtime                datetime comment 'ɾ��ʱ��',
   status               varchar(2) default '1' comment '״̬',
   status2              varchar(2) default '1' comment '״̬λ2',
   primary key (id)
);

alter table t_user comment '�û���';

